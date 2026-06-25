CREATE DATABASE teste_projeto_poo;

USE teste_projeto_poo;

CREATE TABLE Instrutor (
  idInstrutor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome_instrutor VARCHAR(50) NULL,
  PRIMARY KEY(idInstrutor)
);

CREATE TABLE Aluno (
  idAluno INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NULL,
  idade INTEGER UNSIGNED NULL,
  PRIMARY KEY(idAluno)
);

CREATE TABLE Curso (
  idCurso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Instrutor_idInstrutor INTEGER UNSIGNED NOT NULL,
  nome_curso VARCHAR(50) NULL,
  carga_horaria INTEGER UNSIGNED NULL,
  PRIMARY KEY(idCurso),
  INDEX Curso_FKIndex1(Instrutor_idInstrutor),
  FOREIGN KEY(Instrutor_idInstrutor)
    REFERENCES Instrutor(idInstrutor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Aluno_has_Curso (
  Aluno_idAluno INTEGER UNSIGNED NOT NULL,
  Curso_idCurso INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Aluno_idAluno, Curso_idCurso),
  INDEX Aluno_has_Curso_FKIndex1(Aluno_idAluno),
  INDEX Aluno_has_Curso_FKIndex2(Curso_idCurso),
  FOREIGN KEY(Aluno_idAluno)
    REFERENCES Aluno(idAluno)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Curso_idCurso)
    REFERENCES Curso(idCurso)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

SHOW TABLES FROM teste_projeto_poo;