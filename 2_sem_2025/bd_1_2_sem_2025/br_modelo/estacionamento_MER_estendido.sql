-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE tb_cliente (
cpf CHAR(11) PRIMARY KEY,
nome VARCHAR(30)
)

CREATE TABLE tb_veiculo (
placa CHAR(7) PRIMARY KEY,
cpf CHAR(11),
FOREIGN KEY(cpf) REFERENCES tb_cliente (cpf)
)

CREATE TABLE tb_estacionamento (
nr_ticket INTEGER PRIMARY KEY,
dt_hora_saida DATETIME,
dt_hora_entrada DATETIME,
placa CHAR(7),
FOREIGN KEY(placa) REFERENCES tb_veiculo (placa)
)

CREATE TABLE tb_motocicleta (
placa CHAR(7),
cd_tp_motocicleta INTEGER,
FOREIGN KEY(placa) REFERENCES tb_veiculo (placa)
)

CREATE TABLE tb_automovel (
placa CHAR(7),
cd_tp_automovel INTEGER,
FOREIGN KEY(placa) REFERENCES tb_veiculo (placa)
)

CREATE TABLE tb_caminhao (
placa CHAR(7),
cd_tp_caminhao INTEGER,
FOREIGN KEY(placa) REFERENCES tb_veiculo (placa)
)

CREATE TABLE tb_tp_motocicleta (
cd_tp_motocicleta INTEGER PRIMARY KEY,
tipo_motocicleta VARCHAR(30)
)

CREATE TABLE tb_tp_automovel (
cd_tp_automovel INTEGER PRIMARY KEY,
tipo_automovel VARCHAR(30)
)

CREATE TABLE tb_tp_caminhao (
cd_tp_caminhao INTEGER PRIMARY KEY,
tipo_caminhao VARCHAR(30)
)

ALTER TABLE tb_motocicleta ADD FOREIGN KEY(cd_tp_motocicleta) REFERENCES tb_tp_motocicleta (cd_tp_motocicleta)
ALTER TABLE tb_automovel ADD FOREIGN KEY(cd_tp_automovel) REFERENCES tb_tp_automovel (cd_tp_automovel)
ALTER TABLE tb_caminhao ADD FOREIGN KEY(cd_tp_caminhao) REFERENCES tb_tp_caminhao (cd_tp_caminhao)
