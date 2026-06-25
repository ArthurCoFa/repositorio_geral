USE db_company;

SELECT
	e.matricula,
    e.nome,
    c.nm_cargo AS cargo,
    c.salario
FROM
	tb_empregado e
    INNER JOIN 
    tb_cargo c ON id_cargo = fk_cargo;
    
/* Mesmo que não tenha empregado no departamento o departamento vai aparecer */
SELECT
	d.nm_departamento AS departamento,
    e.nome AS empregado
    FROM 
    tb_departamento d
	LEFT JOIN
    tb_empregado e ON id_departamento = fk_departamento;
    
-- exercício
SELECT
	e.matricula,
    e.nome AS empregado,
    c.nm_cargo AS cargo,
    c.salario
FROM
	tb_empregado e
    LEFT JOIN /* Traz todos os empregados mesmo que não tenha cargo */
    tb_cargo c ON id_cargo = fk_cargo;
    
SELECT 
	d.id_departamento,
    d.nm_departamento AS departamento,
    e.nome AS empregado
FROM 
	tb_departamento d
    LEFT JOIN 
    tb_empregado e ON id_departamento = fk_departamento
order by id_departamento;

SELECT 
	d.id_departamento,
    d.nm_departamento AS departamento,
    e.nome AS empregado
FROM 
	tb_empregado e
    RIGHT JOIN 
    tb_departamento d ON id_departamento = fk_departamento
order by id_departamento;