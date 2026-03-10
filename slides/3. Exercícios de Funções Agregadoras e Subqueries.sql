-- 1. Contagem de Empregados
SELECT COUNT(*) AS total_empregados FROM tb_empregado;

-- 2. Soma dos Salários
SELECT SUM(salario) AS total_salarios FROM tb_cargo;

-- 3. Média Salarial
SELECT AVG(salario) AS media_salarial FROM tb_cargo;

-- 4. Maior Salário
SELECT MAX(salario) AS maior_salario FROM tb_cargo;

-- 5. Menor Salário
SELECT MIN(salario) AS menor_salario FROM tb_cargo;

-- 6. Número de Departamentos
SELECT COUNT(*) AS total_departamentos FROM tb_departamento;

-- 7. Contagem de Empregados por Cargo (Sem JOIN)
SELECT cargo, COUNT(*) AS quantidade_empregados 
FROM tb_empregado 
GROUP BY cargo;

-- 8. Salário Médio por Cargo (Sem JOIN)
SELECT fk_cargo AS id_cargo,
       (SELECT AVG(salario) 
        FROM tb_cargo 
        WHERE tb_cargo.id_cargo = tb_empregado.fk_cargo) AS media_salarial
FROM tb_empregado
GROUP BY fk_cargo;

-- 9. Departamentos com mais de 2 empregados (Usando Subquery)
SELECT fk_departamento 
FROM tb_empregado 
GROUP BY fk_departamento 
HAVING COUNT(*) > 2;

-- 10. Identificação do Cargo com Maior Salário (Usando Subquery)
SELECT cargo 
FROM tb_cargo 
WHERE salario = (SELECT MAX(salario) FROM tb_cargo);

-- 11. Identificação do Cargo com Menor Salário (Usando Subquery)
SELECT nm_cargo 
FROM tb_cargo 
WHERE salario = (SELECT MIN(salario) FROM tb_cargo);

-- 12. Funcionários com Salário Acima da Média (Usando Subquery)
SELECT matricula 
FROM tb_empregado 
WHERE fk_cargo IN (
    SELECT id_cargo 
    FROM tb_cargo 
    WHERE salario > (SELECT AVG(salario) FROM tb_cargo)
);


