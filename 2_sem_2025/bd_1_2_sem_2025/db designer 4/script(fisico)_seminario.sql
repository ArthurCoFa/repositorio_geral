CREATE TABLE tb_empresa (
  cnpj INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  empresa CHAR(30) NULL,
  endereço CHAR(30) NULL,
  PRIMARY KEY(cnpj)
);

CREATE TABLE tb_curso (
  cd_curso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  curso CHAR(30) NULL,
  PRIMARY KEY(cd_curso)
);

CREATE TABLE tb_cargo (
  cd_cargo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cargo CHAR(30) NULL,
  PRIMARY KEY(cd_cargo)
);

CREATE TABLE tb_funcionario (
  cpf INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_empresa_cnpj INTEGER UNSIGNED NOT NULL,
  tb_cargo_cd_cargo INTEGER UNSIGNED NOT NULL,
  nome_funcionario CHAR(30) NULL,
  data_nascimento DATE NULL,
  telefone INTEGER UNSIGNED NULL,
  PRIMARY KEY(cpf),
  INDEX tb_funcionario_FKIndex1(tb_cargo_cd_cargo),
  INDEX tb_funcionario_FKIndex2(tb_empresa_cnpj),
  FOREIGN KEY(tb_cargo_cd_cargo)
    REFERENCES tb_cargo(cd_cargo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_empresa_cnpj)
    REFERENCES tb_empresa(cnpj)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_curso_has_tb_funcionario (
  tb_curso_cd_curso INTEGER UNSIGNED NOT NULL,
  tb_funcionario_cpf INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(tb_curso_cd_curso, tb_funcionario_cpf),
  INDEX tb_curso_has_tb_funcionario_FKIndex1(tb_curso_cd_curso),
  INDEX tb_curso_has_tb_funcionario_FKIndex2(tb_funcionario_cpf),
  FOREIGN KEY(tb_curso_cd_curso)
    REFERENCES tb_curso(cd_curso)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_funcionario_cpf)
    REFERENCES tb_funcionario(cpf)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


