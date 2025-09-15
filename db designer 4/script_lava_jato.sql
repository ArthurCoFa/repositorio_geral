CREATE TABLE tb_marca (
  cd_marca INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  marca CHAR(30) NULL,
  PRIMARY KEY(cd_marca)
);

CREATE TABLE tb_funcionario (
  matricula INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome CHAR(30) NULL,
  dt_nascimento DATE NULL,
  PRIMARY KEY(matricula)
);

CREATE TABLE tb_cliente (
  cpf INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome CHAR(30) NULL,
  telefone INTEGER UNSIGNED NULL,
  PRIMARY KEY(cpf)
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
  placa CHAR(7) NOT NULL AUTO_INCREMENT,
  tb_modelo_cd_modelo INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(placa),
  INDEX tb_veiculo_FKIndex1(tb_modelo_cd_modelo),
  FOREIGN KEY(tb_modelo_cd_modelo)
    REFERENCES tb_modelo(cd_modelo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_veiculo_has_tb_cliente (
  tb_veiculo_placa CHAR(7) NOT NULL,
  tb_cliente_cpf INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(tb_veiculo_placa, tb_cliente_cpf),
  INDEX tb_veiculo_has_tb_cliente_FKIndex1(tb_veiculo_placa),
  INDEX tb_veiculo_has_tb_cliente_FKIndex2(tb_cliente_cpf),
  FOREIGN KEY(tb_veiculo_placa)
    REFERENCES tb_veiculo(placa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_cliente_cpf)
    REFERENCES tb_cliente(cpf)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_limpeza (
  nr_limpeza INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_funcionario_matricula INTEGER UNSIGNED NOT NULL,
  tb_veiculo_placa CHAR(7) NOT NULL,
  dt_limpeza DATE NULL,
  valor INTEGER UNSIGNED NULL,
  PRIMARY KEY(nr_limpeza),
  INDEX tb_limpeza_FKIndex1(tb_veiculo_placa),
  INDEX tb_limpeza_FKIndex2(tb_funcionario_matricula),
  FOREIGN KEY(tb_veiculo_placa)
    REFERENCES tb_veiculo(placa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_funcionario_matricula)
    REFERENCES tb_funcionario(matricula)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


