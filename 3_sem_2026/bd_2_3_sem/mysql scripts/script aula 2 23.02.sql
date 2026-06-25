/* Criar o banco de dados "db_ibge" */
CREATE DATABASE db_ibge;

/* uar o banco de dados "db_ibge" */ 
USE db_ibge;

/* Mostra as tabelas do banco de dados "db_ibge" */
SHOW TABLES FROM db_ibge;

/* Mostra colunas da tabela "tb_regioes" */
SHOW COLUMNS FROM tb_regioes;

/* Mostra colunas da tabela "tb_estados" */
SHOW COLUMNS FROM tb_estados;

/* Seleciona todos os dados da tabela "tb_regioes" */
SELECT * FROM tb_regioes;

/* Seleciona todos os dados da tabela "tb_estados" */
SELECT * FROM tb_estados;

/*Criar a tabela tb_regioes*/
CREATE TABLE tb_regioes 
(  
  	id INT NOT NULL PRIMARY KEY,  
	nome VARCHAR(40) NOT NULL,  
	sigla VARCHAR(2) NOT NULL
);

/* Inserir dados na tabela "tb_regioes" */
insert into tb_regioes (id,nome,sigla) 
Values
(1, 'Norte', 'N'),
(2, 'Nordeste', 'NE'),
(3, 'Sudeste', 'SE'),
(4, 'Sul', 'S'),
(5, 'Centro-Oeste', 'CO');

/* Criar tabela "tb_estados" */
CREATE TABLE tb_estados 
(
  id INT NOT NULL PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  sigla VARCHAR(2) NOT NULL,
  id_regiao INT DEFAULT NULL,
  FOREIGN KEY (id_regiao) REFERENCES tb_regioes (id)
);

/* Inserir dados na tabela "tb_estados" */
insert into tb_estados (id,nome,sigla,id_regiao) Values
(11, 'Rondônia', 'RO', 1),
(12, 'Acre', 'AC', 1),
(13, 'Amazonas', 'AM', 1),
(14, 'Roraima', 'RR', 1),
(15, 'Pará', 'PA', 1),
(16, 'Amapá', 'AP', 1),
(17, 'Tocantins', 'TO', 1);

insert into tb_estados (id,nome,sigla,id_regiao) values 
(21, 'Maranhão', 'MA', 2),
(22, 'Piauí', 'PI', 2),
(23, 'Ceará', 'CE', 2),
(24, 'Rio Grande do Norte', 'RN', 2),
(25, 'Paraíba', 'PB', 2),
(26, 'Pernambuco', 'PE', 2),
(27, 'Alagoas', 'AL', 2),
(28, 'Sergipe', 'SE', 2),
(29, 'Bahia', 'BA', 2);

insert into tb_estados (id,nome,sigla,id_regiao) values
(31, 'Minas Gerais', 'MG', 3),
(32, 'Espírito Santo', 'ES', 3),
(33, 'Rio de Janeiro', 'RJ', 3),
(35, 'São Paulo', 'SP', 3);

insert into tb_estados (id,nome,sigla,id_regiao) values
(41, 'Paraná', 'PR', 4),
(42, 'Santa Catarina', 'SC', 4),
(43, 'Rio Grande do Sul', 'RS', 4);

insert into tb_estados (id,nome,sigla,id_regiao) values
(50, 'Mato Grosso do Sul', 'MS', 5),
(51, 'Mato Grosso', 'MT', 5),
(52, 'Goiás', 'GO', 5),
(53, 'Distrito Federal', 'DF', 5);

/* Seleciona os dados que possuem o id_regiao igual a 1 (Região Norte) */
SELECT * FROM tb_estados 
WHERE id_regiao = 1;

-- 6 – Selecione todos os dados da tabela tb_regiões quando o nome da região for igual a Sul
SELECT * FROM tb_regioes
WHERE nome = 'Sul';

-- 7 – Selecione apenas o nome das regiões quando o nome da região o id for maior ou igual a 3
SELECT * FROM tb_regioes
WHERE id >= 3;

-- 8 – Selecione todos os dados da tabela tb_estados que o id da região for igual a 3
SELECT * FROM tb_estados
WHERE id_regiao = 3;

-- 9 – Selecione apenas o nome do estado e a sigla dos estados quando o id estado for menor que 24
SELECT id, nome
FROM tb_estados
WHERE id < 24;

-- 10 – Selecione todos os dados da tabela tb_estados quando id da região for igual a 4 ou 5
SELECT * 
FROM tb_estados
WHERE id_regiao = 4 OR id_regiao = 5;

-- 11– Selecione apenas o nome dos estados quando o id região for igual a 2 e a sigla do estado for igual a AL
SELECT nome 
FROM tb_estados
WHERE id_regiao = 2 AND sigla = 'AL';

-- 12 – Selecione apenas o nome dos estados quando o id região for igual a 2 e a sigla do estado for igual a AL ou CE ou PB
SELECT nome 
FROM tb_estados
WHERE id_regiao = 2 AND
sigla = 'AL' OR
sigla = 'CE' OR
sigla = 'PB';

-- 13 – Selecione apenas o nome dos estados quando o id região for diferente de 2 e a sigla do estado for igual a DF
SELECT nome
FROM tb_estados
WHERE id_regiao != 2 AND
sigla = 'DF';

-- 14 – Selecione o nome dos estados por ordem alfabética de nome de forma ascendente;
SELECT nome
FROM tb_estados
ORDER BY nome asc;

-- 15 – Selecione o nome dos estados por ordem alfabética de nome de forma descente;
SELECT nome
FROM tb_estados
ORDER BY nome desc;

-- 16 - Selecione o nome dos estados e a sigla por ordem crescente de id_região e depois por ordem alfabética de nome estado;
SELECT nome, sigla, id_regiao
FROM tb_estados 
ORDER BY id_regiao, nome asc;

-- 17 – Selecione o nome dos estados cujo o nome tem a palavra “rio”
SELECT nome
FROM tb_estados
WHERE nome LIKE '%rio%';

-- 18 – Selecione o nome dos estados que inicia com a letra A e em ordem alfabética;
SELECT nome 
FROM tb_estados
WHERE nome like 'a%';

-- 19 - Selecione o nome dos estados e a sigla, que o nome do estado termina com a letra A;
SELECT nome, sigla
FROM tb_estados
WHERE nome like '%a';

-- 20 - Selecione o nome dos estados e a sigla, que o nome do estado tenha 4 caracteres;
SELECT nome, sigla
FROM tb_estados
WHERE nome like '____';

-- 21 – Selecione o nome dos estados cuja a sigla seja DF, TO, AC, AL, PB, PA, PR;
SELECT nome 
FROM tb_estados
WHERE sigla IN ('DF', 'TO', 'AC', 'AL', 'PB', 'PA', 'PR');

-- 22 – Selecione o nome dos estados que inicia com a letra A e a sigla seja diferente de AL;
SELECT nome
FROM tb_estados
WHERE nome like 'a%' AND 
sigla != 'AL';

-- 23 - Selecione o nome dos estados e a sigla, que o id da região não seja 11 e 12;
SELECT nome, sigla FROM tb_estados
WHERE id_regiao NOT IN (11, 12);

-- 24 – Selecione o nome e id da região dos estados cuja id_região esteja entre os valores 2 e 4
SELECT nome,id_regiao
FROM tb_estados
WHERE id_regiao between 2 and 4;

SELECT nome,id_regiao
FROM tb_estados
WHERE id_regiao not between 2 and 4;

-- 25 - substitua a sigla de 'CO' para 'BB', onde o nome for 'Centro-Oeste'. Mostre os dados antes e depois da mudança
UPDATE tb_regioes 
SET sigla = 'BB'
WHERE sigla = 'CO';

SELECT * from tb_regioes;

-- 26 - substitua a sigla de 'CO' para 'BB', SEM USAR WHERE e veja o que acontece
UPDATE tb_regioes
SET sigla = 'BB';

-- REFAZENDO
UPDATE tb_regioes
SET sigla = 'N', sigla = 'NE', sigla = 'SE', sigla = 'S', sigla = 'CO'
WHERE id between 1 and 5;