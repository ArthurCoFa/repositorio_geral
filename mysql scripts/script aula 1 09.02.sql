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
SELECT * FROM tb_regioes
WHERE id = 3;

-- 9 – Selecione apenas o nome do estado e a sigla dos estados quando o id estado for menor que 24
SELECT * FROM tb_estados
WHERE id < 24;