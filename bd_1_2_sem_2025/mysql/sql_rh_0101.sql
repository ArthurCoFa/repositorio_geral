CREATE DATABASE bd_rh_0101;

USE bd_rh_0101;

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
    funcionario CHAR(50),
    dt_nascimento DATE,
    salario DECIMAL(8,2),
    cd_setor int,
    cd_cargo int
);

ALTER TABLE tb_funcionario
ADD CONSTRAINT fk_cargo FOREIGN KEY (cd_cargo)
REFERENCES tb_cargo (cd_cargo);

ALTER TABLE tb_funcionario
ADD CONSTRAINT fk_setor FOREIGN KEY (cd_setor)
REFERENCES tb_setor (cd_setor);