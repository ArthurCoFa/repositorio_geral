-- Exercício do Slide 1 (Revisão do SQL básico):

-- 1. Selecionando tudo da tabela regiões
SELECT * FROM tb_regioes;

-- 2. Selecionando apenas os nomes da tabela regiões
SELECT 
	nome
FROM 
	tb_regioes;

-- 3. Selecionando tudo da tabela estados
SELECT * FROM tb_estados;

-- 4. Selecionando nome e sigla do estado
SELECT
	nome, sigla
FROM
	tb_estados;

-- 5. Selecionando id_regiao da tabela estados
SELECT 
	id_regiao
FROM 
	tb_estados;

-- 6. Selecionando tudo da tabela região, mas nome da região tem que ser igual a sul
SELECT *
FROM tb_regioes
WHERE nome = "Sul";

-- 7. Selecionando nome da região, mas o id da região tem que ser maior que 3
SELECT nome
FROM tb_regioes
WHERE id >= 3;

-- 8. Selecionando tudo da tabela estados, mas o id região tem que ser igual a 3
SELECT *
FROM tb_estados
WHERE id_regiao = 3; 

-- 9. Selecionando nome e sigla do estado quando id for menor que 24
SELECT nome, sigla
FROM tb_estados
WHERE id < 24;

-- 10. Selecionando tudo da tabela estados quando id regiao for igual a 4 ou 5
SELECT *
FROM tb_estados
WHERE id_regiao = 4 OR id_regiao = 5;

-- 11. Selecionando nome dos estados quando id regiao for igual a 2 e sigla igual a AL 
SELECT nome
FROM tb_estados
WHERE id_regiao = 2 AND
sigla = "AL";

-- 12. Selecionando nome dos estados quando id for igual a 2 e sigla igual a AL, CE ou PB
SELECT nome
FROM tb_estados
WHERE id_regiao = 2 AND
sigla = "AL" OR
sigla = "CE" OR
sigla = "PB";

-- 13. Selecionando nome do estado quando id regiao for diferente de 2 e sigla igual a DF
SELECT nome
FROM tb_estados
WHERE id_regiao != 2 AND
sigla = "DF";

-- 14. Selecionando nome de forma alfabética;
SELECT nome
FROM tb_estados
ORDER BY nome asc;

-- 15. Selecionando nome de forma alfabética invertida;
SELECT nome
FROM tb_estados
ORDER BY nome desc;

-- 16. Selecionando nome e sigla por ordem crescente e alfabética
SELECT nome, sigla
FROM tb_estados
ORDER BY id_regiao, nome asc;

-- Exercícios a parte usando o que aprendi até agora (Slide 1):

/* Selecionando "id_estado", "nome_estado" e "nome_região" relacionada ao estado,
   sendo que o "id_estado" tem que ser menor que 50.
   Simplificando o nome da tabela "estado" usando 'e'
   Simplificando o nome da tabela "região" usando 'r'
*/
SELECT
	e.id, e.nome,
    (SELECT 
		r.nome
    FROM 
		tb_regioes r
	WHERE
		r.id = e.id_regiao
	) AS regiao
FROM
	tb_estados e
GROUP BY
	id
HAVING 
	e.id < 50;

/* Selecionando nome_estado, sigla_estado e sigla_regiao */
SELECT 
	e.nome, e.sigla AS estado,
	(SELECT 
		r.sigla
	FROM 
		tb_regioes r
	WHERE
		r.id = e.id_regiao) AS regiao
FROM 
	tb_estados e;
    