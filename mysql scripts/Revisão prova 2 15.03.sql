USE db_ibge;

SELECT
	nome
FROM 
	tb_estados
WHERE 
	nome 
    LIKE '____';
    
USE db_company;

SELECT 
	COUNT(*) AS 'Total de empregados'
FROM 
	tb_empregado;

SELECT 
	SUM(salario) AS total_salarios
FROM 
	tb_cargo;
    
SELECT
	AVG(salario) AS media_salarial
FROM
	tb_cargo;
    
SELECT
	COUNT(*) AS total_departamentos
FROM
	tb_departamento;

SELECT
	(SELECT nm_cargo
	 FROM tb_cargo c
     WHERE c.id_cargo = e.fk_cargo) AS cargo,
	COUNT(*) AS empregados
FROM
	tb_empregado e 
GROUP BY cargo;

SELECT
	c.nm_cargo AS cargo,
    ROUND(AVG(c.salario), 2) AS media_salarial
FROM
	tb_cargo c
GROUP BY cargo;

SELECT (
	SELECT d.nm_departamento
    FROM tb_departamento d
    WHERE d.id_departamento = e.fk_departamento) AS departamento
FROM
	tb_empregado e
GROUP BY departamento
HAVING COUNT(*) >= 2;

SELECT 
	nm_cargo AS cargo
FROM 
	tb_cargo c
WHERE c.salario = (
	SELECT MAX(c.salario)
    FROM tb_cargo c
    );

SELECT
	e.matricula AS id_empregado
FROM
	tb_empregado e
WHERE fk_cargo IN (
	SELECT id_cargo
    FROM tb_cargo
    WHERE salario > (
    SELECT AVG(salario)
    FROM tb_cargo)
    )
ORDER BY id_empregado asc;