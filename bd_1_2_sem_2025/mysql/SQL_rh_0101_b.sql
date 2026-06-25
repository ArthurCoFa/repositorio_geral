-- 10-11-2025
-- Aula BD
-- DDL, DML, DQL

CREATE DATABASE bd_rh_0101_b;

USE bd_rh_0101_b;

CREATE TABLE tb_cargo(
	cd_cargo int NOT NULL PRIMARY KEY,
	cargo CHAR(30)
);

CREATE TABLE tb_setor(
	cd_setor int NOT NULL PRIMARY KEY,
	setor CHAR(30)
);

CREATE TABLE tb_funcionario(
	matricula int NOT NULL PRIMARY KEY,
	funcionario CHAR (50),
	dt_nascimento DATE,
	cd_setor int,
	cd_cargo int,
	salario DECIMAL(8,2)
);

ALTER TABLE tb_funcionario
ADD CONSTRAINT fk_cargo FOREIGN KEY (cd_cargo)
REFERENCES tb_cargo(cd_cargo);

ALTER TABLE tb_funcionario
ADD CONSTRAINT fk_setor FOREIGN KEY (cd_setor)
REFERENCES tb_setor (cd_setor);

insert into tb_setor (cd_setor, setor) 
values 
(1, 'Enfermaria'),
(2, 'Administracao'),
(3, 'Informatica'),
(4, 'Engenharia'),
(5, 'Juridico'),
(6, 'Logistica'),
(7, 'Presidencia');

SELECT * FROM tb_setor;

insert into tb_cargo 
(cd_cargo, cargo) 
values 
(1, 'Enfermeiro(a)'),
(2, 'Administrador(a)') ,
(3, 'Analista') ,
(4, 'Engenheiro(a)') ,
(5, 'Advogado(a)') ,
(6, 'Gerente') ,
(7, 'Executivo(a)') ;

SELECT * FROM tb_cargo;

insert into tb_funcionario  
(matricula, funcionario,  dt_nascimento, cd_setor, cd_cargo, salario)
Values  
(1,'Ana Clara', '1977-07-05',  5, 1, 3000),
(2,'Patricia Azevedo', '1944-07-04', 1, 1, 4000),
(3,'Jose Maria', '1971-05-10', 3, 1, 6000),
(4,'Sonia Abrantes', '1979-05-29',  4, 1, 7000), 
(5,'Valdir Reinaldo', '1960-09-22',  2, 2, 16000), 
(6,'Jose Alberto', '1955-01-13',  2, 2, 15000);

SELECT * FROM tb_funcionario;

SELECT * FROM tb_cargo;

-- INCLUIR CARGO 8 - ENGENHEIRO DE COMPUTAÇÃO

INSERT INTO tb_cargo (cd_cargo, cargo)
VALUES (8, 'Engenheiro de computação');

-- alterar salário de ana clara para 5000

UPDATE tb_funcionario
SET salario = 5000.00
WHERE matricula = 1;

UPDATE tb_cargo
SET cargo = 'Eng. Computacao'
WHERE cd_cargo = 8;

DELETE FROM tb_cargo
WHERE cd_cargo = 1;

DELETE FROM tb_cargo
WHERE cd_cargo = 8;

SELECT * FROM tb_funcionario where cd_setor = 2;

SELECT * FROM tb_funcionario where salario > 5000;