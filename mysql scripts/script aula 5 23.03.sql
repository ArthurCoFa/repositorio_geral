/* Criando primeira view */
CREATE VIEW vw_alunos_por_disciplina AS
SELECT
	d.nome AS Disciplina,
    p.nome AS Professor,
    COUNT(m.id_estudante) AS Total_Alunos
FROM
	Matriculas m
    JOIN
    Disciplinas d ON m.id_disciplina = d.id_disciplina
    JOIN
    Professores p ON d.id_professor = p.id_professor
GROUP BY 
	d.nome, p.nome
ORDER BY
	Total_Alunos DESC;

/* Selecionando a view */
SELECT * FROM vw_alunos_por_disciplina;

/* Apagando a view */
DROP VIEW if exists vw_alunos_por_disciplina;

CREATE VIEW ViewAlunos AS
SELECT id_estudante, nome, email FROM estudantes;

SELECT * FROM viewalunos;

SELECT * FROM Alunos;

CREATE VIEW ViewAlunosTI AS
SELECT id_aluno, nome, curso FROM Alunos WHERE curso = 'Tecnologia da Informação';

CREATE VIEW ViewAlunosGraduacao AS
SELECT id_aluno, nome FROM Alunos WHERE curso IN ('Engenharia', 'Ciência de Dados');

SELECT * FROM ViewAlunosTI;
SELECT * FROM ViewAlunosGraduacao;

DROP VIEW IF EXISTS ViewAlunosTI, ViewAlunosGraduacao;

/* Alterando a view */
CREATE VIEW view_alunos_cursos AS
SELECT nome, curso FROM Alunos;

SELECT * FROM view_alunos_cursos;

ALTER VIEW view_alunos_cursos AS
SELECT nome, curso, idade FROM Alunos;

SELECT * FROM view_alunos_cursos;

/* alterando view de forma diferente */
CREATE VIEW view_alunos_cursos AS
SELECT nome, curso FROM Alunos;

CREATE OR REPLACE VIEW view_alunos_cursos AS
SELECT nome, curso, idade FROM Alunos;

/* Nome do banco e views do banco */
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'sistemaacademico';