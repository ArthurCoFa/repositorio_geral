CREATE TABLE tb_instrutor (
  id_instrutor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_instrutor VARCHAR(50) NULL,
  cpf CHAR(11) NULL,
  PRIMARY KEY(id_instrutor)
);

CREATE TABLE tb_aluno (
  id_aluno INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_aluno VARCHAR(50) NULL,
  idade INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_aluno)
);

CREATE TABLE tb_curso (
  id_curso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_instrutor_id_instrutor INTEGER UNSIGNED NOT NULL,
  nome_curso VARCHAR(50) NULL,
  carga_horaria INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_curso),
  INDEX tb_curso_FKIndex1(tb_instrutor_id_instrutor),
  FOREIGN KEY(tb_instrutor_id_instrutor)
    REFERENCES tb_instrutor(id_instrutor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_aluno_has_tb_curso (
  tb_aluno_id_aluno INTEGER UNSIGNED NOT NULL,
  tb_curso_id_curso INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(tb_aluno_id_aluno, tb_curso_id_curso),
  INDEX tb_aluno_has_tb_curso_FKIndex1(tb_aluno_id_aluno),
  INDEX tb_aluno_has_tb_curso_FKIndex2(tb_curso_id_curso),
  FOREIGN KEY(tb_aluno_id_aluno)
    REFERENCES tb_aluno(id_aluno)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_curso_id_curso)
    REFERENCES tb_curso(id_curso)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


