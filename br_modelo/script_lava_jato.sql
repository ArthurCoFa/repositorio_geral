-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE tb_marca (
cd_marca INTEGER PRIMARY KEY,
marca CHAR(30)
)

CREATE TABLE tb_funcionario (
nome CHAR(30),
dt_nsacimento DATETIME,
matricula INTEGER PRIMARY KEY
)

CREATE TABLE tb_limpeza (
dt_limpeza DATETIME,
nr_limpeza INTEGER PRIMARY KEY,
valor DECIMAL(8, 2),
matricula INTEGER,
placa CHAR(7),
FOREIGN KEY(matricula) REFERENCES tb_funcionario (matricula)
)

CREATE TABLE rl_veiculo_cliente (
placa CHAR(7),
cpf CHAR(11),
PRIMARY KEY(placa,cpf)
)

CREATE TABLE tb_cliente (
cpf CHAR(11) PRIMARY KEY,
nome CHAR(30),
telefone CHAR(11)
)

CREATE TABLE tb_veiculo (
placa CHAR(7) PRIMARY KEY,
cd_modelo INTEGER
)

CREATE TABLE tb_modelo (
cd_modelo INTEGER PRIMARY KEY,
modelo CHAR(30),
cd_marca INTEGER,
FOREIGN KEY(cd_marca) REFERENCES tb_marca (cd_marca)
)

ALTER TABLE tb_limpeza ADD FOREIGN KEY(placa) REFERENCES tb_veiculo (placa)
ALTER TABLE rl_veiculo_cliente ADD FOREIGN KEY(placa) REFERENCES tb_veiculo (placa)
ALTER TABLE rl_veiculo_cliente ADD FOREIGN KEY(cpf) REFERENCES tb_cliente (cpf)
ALTER TABLE tb_veiculo ADD FOREIGN KEY(cd_modelo) REFERENCES tb_modelo (cd_modelo)
