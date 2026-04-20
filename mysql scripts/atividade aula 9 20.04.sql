/* Contexto
Você é analista de dados de uma empresa de e-commerce chamada ShopNow. O banco de dados registra produtos, clientes, vendas e avaliações. Seu objetivo é construir uma camada analítica completa usando Views, CTEs, Stored Procedures e Operadores de Conjunto.

Passo 1 — Criar o banco e as tabelas */

CREATE DATABASE IF NOT EXISTS shopnow;
USE shopnow;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50),
    data_cadastro DATE
);

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50)
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);


/* Passo 2 — Popular o banco */

INSERT INTO categorias (nome) VALUES
('Eletrônicos'), ('Livros'), ('Roupas'), ('Alimentos');

INSERT INTO clientes (nome, email, cidade, data_cadastro) VALUES
('Ana Silva',    'ana@email.com',    'São Paulo',    '2023-01-10'),
('Bruno Costa',  'bruno@email.com',  'Rio de Janeiro','2023-03-22'),
('Carla Mendes', 'carla@email.com',  'Curitiba',     '2023-06-05'),
('Diego Alves',  'diego@email.com',  'São Paulo',    '2024-01-15'),
('Eva Santos',   'eva@email.com',    'Recife',       '2024-02-20');

INSERT INTO produtos (nome, preco, estoque, id_categoria) VALUES
('Notebook',         3500.00, 10, 1),
('Smartphone',       1800.00, 25, 1),
('Clean Code',         90.00, 50, 2),
('Camiseta Dev',       60.00, 80, 3),
('Chocolate Premium',  35.00,100, 4),
('Headphone',         250.00, 15, 1),
('SQL na Prática',     75.00, 40, 2);

INSERT INTO vendas (id_cliente, id_produto, quantidade, data_venda) VALUES
(1,1,1,'2024-01-05'),(1,3,2,'2024-01-10'),
(2,2,1,'2024-02-14'),(2,6,1,'2024-02-20'),
(3,4,3,'2024-03-01'),(3,5,5,'2024-03-15'),
(4,2,1,'2024-04-10'),(4,7,1,'2024-04-12'),
(5,1,1,'2024-05-01'),(1,6,1,'2024-05-20'),
(2,3,1,'2024-06-01'),(3,2,2,'2024-06-10');

INSERT INTO avaliacoes (id_cliente, id_produto, nota) VALUES
(1,1,5),(1,3,4),(2,2,3),(2,6,5),(3,4,4),
(3,5,2),(4,2,4),(4,7,5),(5,1,5),(1,6,4);


/* Passo 3 — Criar as Views*/ 

/* Tarefa 3.1 — View vw_resumo_vendas */
/* Crie uma view chamada vw_resumo_vendas que mostre, para cada venda:
Nome do cliente, Cidade do cliente, Nome do produto, Categoria do produto, Quantidade vendida,
Preço unitário, Total da venda (quantidade × preço) */

CREATE OR REPLACE VIEW vw_resumo_vendas AS
SELECT 
	cl.nome AS cliente, 
    cl.cidade AS cidade_cliente,
    p.nome AS produto,
    ca.nome AS categoria,
    v.quantidade AS quantidade,
    p.preco AS preco_unitario,
    (p.preco * v.quantidade) AS total_venda
FROM 
	categorias ca
    JOIN
	produtos p ON ca.id_categoria = p.id_categoria
    JOIN 
	vendas v ON v.id_produto = p.id_produto
    JOIN 
    clientes cl ON cl.id_cliente = v.id_cliente
GROUP BY p.id_produto, cl.id_cliente, v.id_venda
ORDER BY cl.nome;
    
SELECT * FROM vw_resumo_vendas;


/* Tarefa 3.2 — View vw_desempenho_produtos
Crie uma view chamada vw_desempenho_produtos que mostre, para cada produto:
Nome do produto, Categoria, Total de unidades vendidas, Receita total gerada, 
Nota média das avaliações (produtos sem avaliação devem aparecer com nota NULL) */

SELECT * FROM avaliacoes;
SELECT * FROM produtos;

CREATE OR REPLACE VIEW vw_desempenho_produtos AS
SELECT 
	p.nome AS produto,
    ca.nome AS categoria,
    (SELECT SUM(v.quantidade) 
    FROM vendas v
    WHERE v.id_produto = p.id_produto) AS total_vendido,
    (SELECT SUM(p.preco * v.quantidade)
    FROM vendas v
    WHERE v.id_produto = p.id_produto) AS receita_total,
    ROUND(AVG(a.nota), 1) AS nota_media
FROM 
    categorias ca
    LEFT JOIN
    produtos p ON ca.id_categoria = p.id_categoria
    LEFT JOIN 
    avaliacoes a ON p.id_produto = a.id_produto
GROUP BY p.id_produto, ca.id_categoria;
    
SELECT * FROM vw_desempenho_produtos;


/* Tarefa 3.3 — Consulta sobre a View
Usando a view vw_desempenho_produtos, escreva uma consulta que:
•	Liste apenas os produtos com receita total acima de R$ 1.000,00
•	Ordene os resultados da maior para a menor receita */

CREATE OR REPLACE VIEW vw_receita_produtos AS
SELECT 
	p.nome AS produto,
    SUM(v.quantidade * p.preco) AS total_receita
FROM 
	produtos p
    JOIN
    vendas v ON p.id_produto = v.id_produto
GROUP BY p.nome, p.id_produto
HAVING
	total_receita > 1000
ORDER BY total_receita;

SELECT * FROM vw_receita_produtos;

    
/* Passo 4 — Criar as Stored Procedures
Tarefa 4.1 — Procedure sp_registrar_venda
Crie uma procedure chamada sp_registrar_venda com os seguintes parâmetros:
•	IN p_id_cliente INT
•	IN p_id_produto INT
•	IN p_quantidade INT
•	OUT p_status VARCHAR(100)

A procedure deve:
1.	Verificar se o estoque do produto é suficiente para a quantidade solicitada
2.	Se SIM: inserir a venda com a data atual e subtrair a quantidade do estoque
3.	Se NÃO: retornar no parâmetro OUT a mensagem 'Estoque insuficiente'
4.	Se bem-sucedida: retornar 'Venda registrada com sucesso' */

DELIMITER &&
CREATE PROCEDURE sp_registrar_venda (
    IN p_id_cliente INT, 
    IN p_id_produto INT,
	IN p_quantidade INT, 
    OUT p_status VARCHAR(100)
)
BEGIN
	
    DECLARE p_estoque_atual INT;

	SELECT estoque INTO p_estoque_atual
    FROM produtos 
    WHERE id_produto = p_id_produto;
    
    IF p_quantidade > p_estoque_atual THEN
		SET p_status = 'Estoque menor que quantidade desejada';
	ELSE 
		INSERT INTO vendas(id_cliente, id_produto, quantidade, data_venda) 
        VALUES (p_id_cliente, p_id_produto, p_quantidade, NOW());
        
        UPDATE produtos 
        SET estoque = estoque - p_quantidade
        WHERE id_produto = p_id_produto;
        
        SET p_status = 'Venda realizada';
	END IF;
END 
&& DELIMITER ;
        
DROP PROCEDURE sp_registrar_venda;
        
-- Deve funcionar normalmente
CALL sp_registrar_venda(3, 5, 10, @resultado);
SELECT @resultado;

-- Deve retornar: Estoque insuficiente
CALL sp_registrar_venda(1, 1, 999, @resultado);
SELECT @resultado;

SELECT * FROM produtos;

/* Tarefa 4.2 — Procedure sp_relatorio_cliente
Crie uma procedure chamada sp_relatorio_cliente que:
•	Receba o parâmetro IN p_id_cliente INT
•	Exiba com um SELECT o nome do cliente
•	Calcule e exiba o valor total gasto pelo cliente (soma de quantidade × preço de todas as compras) */

DELIMITER &&
CREATE PROCEDURE sp_relatorio_cliente (
	IN p_id_cliente INT
)
BEGIN 
	SELECT 
		cl.nome AS cliente,
        SUM(v.quantidade * p.preco) AS total_gasto
	FROM 
		clientes cl
		LEFT JOIN 
		vendas v ON v.id_cliente = cl.id_cliente
		LEFT JOIN
		produtos p ON p.id_produto = v.id_produto
    WHERE 
		cl.id_cliente = p_id_cliente
	GROUP BY 
		cl.id_cliente, cl.nome;
END 
&& DELIMITER ;
    
DROP PROCEDURE sp_relatorio_cliente;
    
CALL sp_relatorio_cliente(1);

/* Passo 5 — Consultas com CTEs */
/* Tarefa 5.1 — Participação por categoria
Usando CTEs, calcule o percentual de participação de cada categoria na receita total da loja. O resultado deve conter:
•	Nome da categoria
•	Receita total da categoria
•	Percentual em relação à receita geral (arredondado em 2 casas decimais) */

WITH receita_por_categoria AS (
	SELECT 
		ca.nome AS categoria,
        SUM(v.quantidade * p.preco) AS receita_categoria
	FROM
		categorias ca
        JOIN 
        produtos p ON p.id_categoria = ca.id_categoria
        JOIN
        vendas v ON v.id_produto = p.id_produto
	GROUP BY ca.nome, ca.id_categoria
),
receita_total_loja AS (
	SELECT 
		SUM(receita_categoria) AS receita_total
    FROM
		receita_por_categoria
)
SELECT
	rpc.categoria,
    rpc.receita_categoria,
    ROUND((rpc.receita_categoria / rtl.receita_total) * 100, 2) AS percentual_receital_geral
FROM
	receita_por_categoria rpc, 
    receita_total_loja rtl;


