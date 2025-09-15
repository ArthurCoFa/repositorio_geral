-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE rl_venda_produto (
nr_recibo INTEGER,
cd_remedio INTEGER,
valor_parcial DECIMAL(8,2),
quantidade INTEGER,
PRIMARY KEY(nr_recibo,cd_remedio)
)

CREATE TABLE tb_remedios (
cd_remedio INTEGER PRIMARY KEY,
nome_produto CHAR(30),
valor DECIMAL(8,2)
)

CREATE TABLE tb_vendas (
nr_recibo INTEGER PRIMARY KEY,
cpf CHAR(11),
dt_venda DATETIME,
valor_total DECIMAL(8,2)
)

CREATE TABLE tb_clientes (
cpf CHAR(11) PRIMARY KEY,
cd_cidade INTEGER,
cliente_nome CHAR(30),
telefone CHAR(11)
)

CREATE TABLE tb_cidade (
cd_cidade INTEGER PRIMARY KEY,
cd_estado INTEGER,
cidade_nome CHAR(30)
)

CREATE TABLE tb_estado (
cd_estado INTEGER PRIMARY KEY,
estado_nome CHAR(30)
)

ALTER TABLE rl_venda_produto ADD FOREIGN KEY(nr_recibo) REFERENCES tb_vendas (nr_recibo)
ALTER TABLE rl_venda_produto ADD FOREIGN KEY(cd_remedio) REFERENCES tb_remedios (cd_remedio)
ALTER TABLE tb_vendas ADD FOREIGN KEY(cpf) REFERENCES tb_clientes (cpf)
ALTER TABLE tb_clientes ADD FOREIGN KEY(cd_cidade) REFERENCES tb_cidade (cd_cidade)
ALTER TABLE tb_cidade ADD FOREIGN KEY(cd_estado) REFERENCES tb_estado (cd_estado)
