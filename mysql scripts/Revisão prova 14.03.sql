-- DDL: Definição do banco e tabelas. ALTER, DROP e CREATE;
-- DML: Manipulação de dados. INSERT, UPDATE, SELECT e DELETE. CRUD;
-- DTL: Transação.
-- DCL: Controle de acesso.

USE db_company;

-- COUNT(); EX: 
SELECT COUNT(*) AS total_empregados FROM tb_empregado;

-- COUNT(*) é uma função que conta o total de linhas independente de haver valores null em alguma coluna.

-- SUM(); EX:
SELECT SUM(salario) AS salario_total FROM tb_cargo;

-- AVG(); EX:
SELECT AVG(salario) AS salario_médio FROM tb_cargo;

-- OU
SELECT ROUND(AVG(salario), 2) AS salario_médio FROM tb_cargo;

-- MAX(); EX:
SELECT MAX(salario) AS maior_salario FROM tb_cargo;

-- MIN(); EX:
SELECT MIN(salario) AS maior_salario FROM tb_cargo;

-- GROUP BY: Seleciona a coluna da qual os valores das linhas devem ser agrupados

-- 7. Contagem de Empregados por Cargo Liste os cargos e a quantidade de empregados em cada um, sem utilizar JOIN.

SELECT id_cargo, nm_cargo, nome, fk_cargo FROM tb_cargo, tb_empregado
WHERE fk_cargo = id_cargo;

SELECT
	c.nm_cargo,
	(SELECT
		COUNT(*)
	 FROM
		tb_empregado e
	 WHERE
		c.id_cargo = e.fk_cargo) AS 'número de empregados'
FROM	
	tb_cargo c;
    
SELECT 	
	(SELECT 
		c.nm_cargo
	 FROM
		tb_cargo c
	 WHERE 
		c.id_cargo = e.fk_cargo) AS cargo, 
    COUNT(*) AS quantidade_empregados 
FROM tb_empregado e
GROUP BY cargo;

SELECT 
	c.nm_cargo,
    COUNT(*) AS quantidade_empregados
FROM
	tb_empregado e 
    INNER JOIN 
    tb_cargo c ON c.id_cargo = e.fk_cargo
GROUP BY c.nm_cargo;

-- 8. Salário Médio por Cargo Liste os cargos e o salário médio correspondente, sem usar JOIN.
SELECT
	nm_cargo,
	ROUND(AVG(salario), 2) AS media_salarial
FROM 
	tb_cargo
GROUP BY nm_cargo
ORDER BY media_salarial asc;

SELECT DISTINCT (
	SELECT nm_cargo
    FROM tb_cargo c
    WHERE c.id_cargo = e.fk_cargo
    ) AS cargo, (
    SELECT ROUND(AVG(salario), 2) 
    FROM tb_cargo c 
    WHERE c.id_cargo = e.fk_cargo
    ) AS media_salarial
FROM
	tb_empregado e
ORDER BY media_salarial asc;

-- 9. Departamentos com mais de 5 Empregados Utilize uma subquery para listar os departamentos que possuem mais de 2 empregados.

SELECT id_departamento, nm_departamento, nome, fk_departamento
FROM tb_departamento, tb_empregado
WHERE id_departamento = fk_departamento;

SELECT
	(SELECT nm_departamento
    FROM tb_departamento d
    WHERE e.fk_departamento = d.id_departamento) AS departamento
FROM
	tb_empregado e
GROUP BY fk_departamento
HAVING COUNT(*) > 2;

SELECT
	d.nm_departamento
FROM
	tb_departamento d
    INNER JOIN
    tb_empregado e ON e.fk_departamento = d.id_departamento
GROUP BY d.nm_departamento
HAVING COUNT(*) > 2;
    
SELECT 
	d.nm_departamento
FROM 
	tb_departamento d
WHERE d.id_departamento IN (
	SELECT e.fk_departamento
    FROM tb_empregado e
    GROUP BY e.fk_departamento
    HAVING COUNT(*) > 2
    );
    
-- 12. Funcionários com Salário Acima da Média Liste os IDs dos empregados cujo salário está acima da média salarial geral, sem JOIN.
SELECT matricula
FROM tb_empregado e
WHERE fk_cargo IN (
	SELECT id_cargo
    FROM tb_cargo 
    WHERE salario > (SELECT AVG(salario) 
    FROM tb_cargo)
    );
    
SELECT
	matricula
FROM 
	tb_empregado e
WHERE fk_cargo IN (
	SELECT id_cargo
    FROM tb_cargo c
    WHERE salario > (SELECT avg(salario)
    FROM tb_cargo c)
    )
order by matricula asc;

SELECT 
	e.matricula
FROM 
	tb_empregado e
    INNER JOIN
	tb_cargo c ON c.id_cargo = e.fk_cargo
WHERE c.salario > (
	SELECT AVG(c.salario) FROM tb_cargo c
    )
ORDER BY matricula asc;

SELECT 
	e.matricula
FROM 
	tb_empregado e
    INNER JOIN
	tb_cargo c ON c.id_cargo = e.fk_cargo
	INNER JOIN
    (SELECT AVG(c.salario) AS media_salarial FROM tb_cargo c) m
WHERE c.salario > m.media_salarial
ORDER BY e.matricula asc;

USE esocial;
    
-- 4.1.	Liste o nome do empregador e o nome do empregado que possuem o mesmo id_empregador.
SELECT 
	e.nome_empregado,
    er.nome_empregador
FROM
	empregados e 
    INNER JOIN 
    empregadores er ON e.id_empregador = er.id_empregador;
    
    
SELECT
	nome_empregado,
    (SELECT nome_empregador
    FROM empregadores er
    WHERE er.id_empregador = e.id_empregador) AS empregador
FROM
	empregados e;
    
    
/* 4.2.	Exiba o nome do empregador, o nome do empregado e a 
   data de admissão do empregado para todos os registros da tabela Empregados, 
   mesmo que não haja correspondência com a tabela Empregadores. */
   
SELECT 
	er.nome_empregador,
    e.nome_empregado,
    e.data_admissao
FROM
	empregados e
    LEFT JOIN
    empregadores er ON e.id_empregador = er.id_empregador;
    
SELECT
	(SELECT er.nome_empregador
    FROM empregadores er
    WHERE er.id_empregador = e.id_empregador) AS empregador,
	e.nome_empregado,
    e.data_admissao
FROM
	empregados e;
    
/* 4.3.	Liste o nome do empregador e o nome do empregado 
   apenas para os registros em que o empregado possui uma folha de pagamento.*/
    
SELECT  
	er.nome_empregador,
    e.nome_empregado
FROM
	empregadores er
    INNER JOIN
    empregados e ON er.id_empregador = e.id_empregador
    INNER JOIN
    folhapagamentos f ON f.id_empregado = e.id_empregado;
    
SELECT
	(SELECT e.nome_empregado
    FROM empregados e
    WHERE e.id_empregado = f.id_empregado) AS empregado,
    (SELECT er.nome_empregador
    FROM empregadores er
    WHERE er.id_empregador = 
    (SELECT e.id_empregador
    FROM empregados e
    WHERE e.id_empregado = f.id_empregado)) AS empregador
FROM 
	folhapagamentos f;


/* 4.4.	Exiba o nome do empregador e o nome do empregado para todos os 
   registros da tabela Empregadores, mesmo que não haja correspondência com a tabela Empregados. */
   
SELECT
	nome_empregador,
    nome_empregado
FROM 
	empregadores er
    LEFT JOIN 
    empregados e ON e.id_empregador = er.id_empregador;
    
SELECT 
	(SELECT group_concat(nome_empregado)
	FROM empregados e 
    WHERE e.id_empregador = er.id_empregador) AS empregado,
    nome_empregador
FROM 
	empregadores er;

/* 4.5.	Liste o nome do empregador, o nome do empregado e o mês de referência da folha de pagamento 
	para todos os registros da tabela FolhaPagamentos. */
    
SELECT 
	nome_empregador,
    nome_empregado,
    mes_referencia
FROM
	folhapagamentos f
    INNER JOIN
    empregados e ON e.id_empregado = f.id_empregado
    INNER JOIN
    empregadores er ON er.id_empregador = e.id_empregador;
    
/* 4.6.	Exiba o nome do empregador, o nome do  empregado, o cpf do empregado e o motivo de afastamento do 
	empregado apenas para os registros em que o empregado possui um afastamento. */
    
SELECT
	nome_empregador,
    nome_empregado,
    cpf_empregado,
    motivo
FROM
	empregadores er
    INNER JOIN 
    empregados e ON er.id_empregador = e.id_empregador
    INNER JOIN
    afastamentos a ON a.id_empregado = e.id_empregado;
    
/* 4.7.	Liste o nome do empregador e o tipo de acidente do empregado apenas para os 
	registros em que o empregado possui uma Comunicação de Acidente de Trabalho (CAT).*/ 
    
SELECT 
	nome_empregador,
    tipo_acidente
FROM
	empregadores er
    INNER JOIN 
    empregados e ON e.id_empregador = er.id_empregador
    INNER JOIN 
    cat c ON c.id_empregado = e.id_empregado;
    
/* 4.8.	Exiba o nome do empregador e a data de aviso do empregado apenas para os registros em que o empregado possui um aviso prévio. */

SELECT 
	nome_empregador,
    data_aviso
FROM
	empregadores er
    INNER JOIN 
    empregados e ON e.id_empregador = er.id_empregador
    INNER JOIN 
    avisoprevio ap ON e.id_empregado = ap.id_empregado;
    
/* 4.9.	Liste o nome do empregador e a data de demissão do empregado apenas para os registros em que o empregado possui uma demissão registrada */

SELECT
	nome_empregador,
    nome_empregado,
    data_demissao
FROM
	empRegadores er
    INNER JOIN
	empregados e ON e.id_empregador = er.id_empregador
    INNER JOIN
    demissao d ON d.id_empregado = e.id_empregado;
    

/* TESTANDO COM OUTRO BANCO */
USE sistema_cursos;

SELECT * FROM aluno;

SELECT * FROM curso_aluno;

SELECT * FROM curso;

SELECT * FROM instrutor;

SELECT
	a.nome AS aluno,
    i.nome AS instrutor
FROM
	aluno a
    INNER JOIN
    curso c ON a.id = c.id
    INNER JOIN
    instrutor i ON i.id = c.instrutor_id
WHERE instrutor_id != 1;
