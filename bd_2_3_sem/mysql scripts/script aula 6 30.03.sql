drop database loja;
-- Criar banco de dados
CREATE DATABASE loja;

USE loja;

-- Tabela de Produtos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    peso DECIMAL(10,2) NOT NULL,  -- Peso do produto em kg
    tipo_produto VARCHAR(50) NOT NULL,
    estoque INT NOT NULL
);

-- Tabela de Endereços (para simular a distância de entrega)
CREATE TABLE enderecos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cidade VARCHAR(100),
    estado VARCHAR(100),
    distancia INT  -- Distância do armazém em km
);

-- Tabela de Compras
CREATE TABLE compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_endereco INT,
    data_compra DATETIME,
    valor_frete DECIMAL(10,2),
    FOREIGN KEY (id_produto) REFERENCES produtos(id),
    FOREIGN KEY (id_endereco) REFERENCES enderecos(id)
);

-- Inserir 10 produtos aleatórios
INSERT INTO produtos (nome, peso, tipo_produto,estoque) VALUES
('Smartphone', 0.35, 'Eletrônicos',5),
('TV 55" LED', 7.5, 'Eletrônicos',7),
('Cafeteira', 1.2, 'Eletrônicos',10),
('Arroz', 5.0, 'Alimentos',20),
('Feijão', 3.0, 'Alimentos',5),
('Cadeira Gamer', 12.3, 'Móveis',3),
('Sofá de 3 Lugares', 45.5, 'Móveis',2),
('Notebook', 2.1, 'Eletrônicos',10),
('Livro de História', 0.8, 'Livros',8),
('Camiseta', 0.25, 'Vestuário',30);

-- Inserir 10 endereços aleatórios
INSERT INTO enderecos (cidade, estado, distancia) VALUES
('São Paulo', 'SP', 300),
('Rio de Janeiro', 'RJ', 400),
('Belo Horizonte', 'MG', 600),
('Curitiba', 'PR', 700),
('Porto Alegre', 'RS', 1000),
('Salvador', 'BA', 1200),
('Fortaleza', 'CE', 1500),
('Recife', 'PE', 1100),
('Brasília', 'DF', 900),
('Manaus', 'AM', 2000);

-- Inserir 10 compras aleatórias
INSERT INTO compras (id_produto, id_endereco, data_compra, valor_frete) VALUES
(1, 1, '2025-03-01 10:00:00', 0),
(2, 2, '2025-03-02 11:30:00', 0),
(3, 3, '2025-03-03 09:00:00', 0),
(4, 4, '2025-03-04 14:20:00', 0),
(5, 5, '2025-03-05 15:00:00', 0),
(6, 6, '2025-03-06 16:40:00', 0),
(7, 7, '2025-03-07 17:10:00', 0),
(8, 8, '2025-03-08 18:30:00', 0),
(9, 9, '2025-03-09 20:00:00', 0),
(10, 10, '2025-03-10 21:50:00', 0);



drop procedure atualizar_peso_produto;

select * from produtos;

DELIMITER $$
CREATE PROCEDURE atualizar_peso_produto(IN id_produto INT, IN novo_peso DECIMAL(10,2)) 
BEGIN 
     UPDATE produtos 
      SET peso= novo_peso 
      WHERE id = id_produto; 
END 
$$ DELIMITER ;

call atualizar_peso_produto(1,0.40);

select * from produtos;
-- ------------------
DELIMITER //
CREATE PROCEDURE AtualizaEstoque(
  IN produto_id INT, 
  IN quantidade_vendida INT
)
BEGIN
  UPDATE produtos 
  SET estoque = estoque - quantidade_vendida 
  WHERE id = produto_id 
  AND estoque >= quantidade_vendida;
END //
DELIMITER ;

CALL AtualizaEstoque(10, 5);

select * from produtos;
-- -----------------
DELIMITER //

CREATE PROCEDURE AplicaDesconto(
  INOUT valor DECIMAL(10,2)
)
BEGIN
  IF valor >= 1000 THEN
    SET valor = valor * 0.90;
  ELSEIF valor >= 500 THEN
    SET valor = valor * 0.95;
  ELSE
    SET valor = valor * 0.98;
  END IF;
END //

DELIMITER ;



-- -------------------
DELIMITER //
CREATE PROCEDURE CalcularFrete(
    IN p_peso DECIMAL(10,2),
    IN p_distancia INT,
    IN p_tipo_produto VARCHAR(50),
    OUT p_valor_frete DECIMAL(10,2)
)
BEGIN
    DECLARE taxa_base DECIMAL(10,2);
    
    -- Define taxa base conforme tipo do produto
    IF p_tipo_produto = 'Eletrônicos' THEN
        SET taxa_base = 2.5;
    ELSEIF p_tipo_produto = 'Alimentos' THEN
        SET taxa_base = 1.8;
    ELSE
        SET taxa_base = 1.2;
    END IF;
    
    -- Calcula valor do frete
    SET p_valor_frete = (p_peso * 0.1) + (p_distancia * 0.05) + taxa_base;
END 
// DELIMITER ;

-- calculando o frete de um smartphone para São Paulo
-- Declarar a variável de sessão para armazenar o valor do frete
SET @valor_frete = 0;

-- Chamar a stored procedure com os parâmetros de entrada e a variável para o valor de saída
CALL CalcularFrete(0.35, 300, 'Eletrônicos', @valor_frete);

-- Exibir o valor do frete calculado
SELECT @valor_frete AS valor_frete_calculado;

/* CODIGOS DA AULA */
SELECT * FROM produtos;

DELIMITER $$
CREATE PROCEDURE atualizarEstoque(
	IN produto_id INT,
    IN quantidade_vendida INT
	)
BEGIN
	UPDATE produtos
    SET estoque = estoque - quantidade_vendida
    WHERE id = produto_id
    AND estoque >= quantidade_vendida;
END
$$ DELIMITER ;


DROP PROCEDURE IF EXISTS atualizarEstoque;

CALL atualizarEstoque(10, 5);

delimiter //
create procedure aplicar_desconto(
	in valor int,
	out resposta decimal(10,2)
)
BEGIN
	if valor > 2000 then
		set resposta = valor * 0.9;
	elseif valor > 1000 then
		set resposta = valor * 0.8;
	else set resposta = valor;
	end if;
end
// delimiter ;

call aplicar_desconto(1500,@desconto);

select @desconto;

SELECT * FROM produtos;

DELIMITER //
CREATE PROCEDURE VerificarEnvioProduto(
	IN p_id_produto INT,
	OUT p_mensagem_envio VARCHAR(255)
)
BEGIN
	DECLARE v_tipo_produto VARCHAR(50);
	-- Obter o tipo do produto
	SELECT tipo_produto INTO v_tipo_produto
	FROM produtos
	WHERE id = p_id_produto;
	-- Avaliar a mensagem com base no tipo usando CASE
	CASE v_tipo_produto
	WHEN 'Alimentos' THEN
		SET p_mensagem_envio = 'Produto perecível';
	WHEN 'Livros' THEN
		SET p_mensagem_envio = 'Envio padrão';
	WHEN 'Vestuário' THEN
		SET p_mensagem_envio = 'Embalagem flexível';
	ELSE
		SET p_mensagem_envio = 'Avaliação manual';
	END CASE;
END 
// DELIMITER ;

CALL VerificarEnvioProduto(4, @Mensagem);

SELECT @Mensagem;

DELIMITER //
CREATE PROCEDURE GerarParcelasSAC(
	IN p_id_contrato INT,
	IN p_valor_total DECIMAL(10,2),
	IN p_qtd_parcelas INT,
	IN p_taxa_juros_mensal DECIMAL(10,4),
	IN p_primeiro_vencimento DATE
)
BEGIN
	DECLARE parcela INT DEFAULT 1;
	DECLARE amortizacao DECIMAL(10,2);
	DECLARE saldo DECIMAL(10,2);
	DECLARE juros DECIMAL(10,2);
	DECLARE valor_parcela DECIMAL(10,2);
	DECLARE vencimento DATE;
 
	SET amortizacao = p_valor_total / p_qtd_parcelas;
	SET saldo = p_valor_total;
	WHILE parcela <= p_qtd_parcelas DO
		SET juros = ROUND(saldo * p_taxa_juros_mensal, 2);
		SET valor_parcela = ROUND(amortizacao + juros, 2);
		SET vencimento = DATE_ADD(p_primeiro_vencimento, INTERVAL parcela - 1 MONTH);
		INSERT INTO parcelas_financiamento (
			id_contrato, numero_parcela, valor_amortizacao,
			valor_juros, valor_parcela, saldo_restante,
			data_vencimento
		)
		VALUES (
			p_id_contrato, parcela, amortizacao, juros,
			valor_parcela, saldo, vencimento
		);
		-- Subtrai amortização do saldo
	SET saldo = saldo - amortizacao;
	SET parcela = parcela + 1;
 END WHILE;
END
// DELIMITER ;

CALL GerarParcelasSAC(
	101, -- id_contrato
	100000.00, -- valor total do financiamento
	10, -- número de parcelas
	0.01, -- juros de 1% ao mês
	'2025-05-10' -- primeiro vencimento
);

