-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE tb_produto (
cd_produto INTEGER PRIMARY KEY,
valor DECIMAL(8, 2),
produto CHAR(30)
)

CREATE TABLE tb_venda (
nr_recibo INTEGER PRIMARY KEY,
cd_produto INTEGER,
cd_filial INTEGER,
cd_vendedor INTEGER,
quantidade INTEGER,
valor_venda DECIMAL(8, 2),
FOREIGN KEY(cd_produto) REFERENCES tb_produto (cd_produto)
)

CREATE TABLE tb_filial (
cd_filial INTEGER PRIMARY KEY,
cd_cidade INTEGER,
filial CHAR(30)
)

CREATE TABLE tb_cidade (
cd_cidade INTEGER PRIMARY KEY,
cd_estado INTEGER,
cidade CHAR(30)
)

CREATE TABLE tb_estado (
cd_estado INTEGER PRIMARY KEY,
estado CHAR(30)
)

CREATE TABLE tb_vendedor (
cd_vendedor INTEGER PRIMARY KEY,
vendedor CHAR(30)
)

ALTER TABLE tb_venda ADD FOREIGN KEY(cd_filial) REFERENCES tb_filial (cd_filial)
ALTER TABLE tb_venda ADD FOREIGN KEY(cd_vendedor) REFERENCES tb_vendedor (cd_vendedor)
ALTER TABLE tb_filial ADD FOREIGN KEY(cd_cidade) REFERENCES tb_cidade (cd_cidade)
ALTER TABLE tb_cidade ADD FOREIGN KEY(cd_estado) REFERENCES tb_estado (cd_estado)
