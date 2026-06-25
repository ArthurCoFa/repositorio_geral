CREATE TABLE tb_produto (
  cd_produto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  produto CHAR(30) NULL,
  PRIMARY KEY(cd_produto)
);

CREATE TABLE tb_marca (
  cd_marca INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  marca CHAR(30) NULL,
  PRIMARY KEY(cd_marca)
);

CREATE TABLE tb_modelo (
  cd_modelo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_marca_cd_marca INTEGER UNSIGNED NOT NULL,
  modelo CHAR(30) NULL,
  PRIMARY KEY(cd_modelo),
  INDEX tb_modelo_FKIndex1(tb_marca_cd_marca),
  FOREIGN KEY(tb_marca_cd_marca)
    REFERENCES tb_marca(cd_marca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_veiculo (
  placa INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_modelo_cd_modelo INTEGER UNSIGNED NOT NULL,
  ano INTEGER UNSIGNED NULL,
  PRIMARY KEY(placa),
  INDEX tb_veiculo_FKIndex1(tb_modelo_cd_modelo),
  FOREIGN KEY(tb_modelo_cd_modelo)
    REFERENCES tb_modelo(cd_modelo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_venda (
  nr_venda INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_produto_cd_produto INTEGER UNSIGNED NOT NULL,
  tb_veiculo_placa INTEGER UNSIGNED NOT NULL,
  dt_venda DATE NULL,
  vl_total DECIMAL(8,2) NULL,
  PRIMARY KEY(nr_venda),
  INDEX tb_venda_FKIndex1(tb_veiculo_placa),
  INDEX tb_venda_FKIndex2(tb_produto_cd_produto),
  FOREIGN KEY(tb_veiculo_placa)
    REFERENCES tb_veiculo(placa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_produto_cd_produto)
    REFERENCES tb_produto(cd_produto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


