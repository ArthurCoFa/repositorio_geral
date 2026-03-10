-- Criação do banco de dados
CREATE DATABASE esocial;

-- Utilização do banco de dados
USE esocial;

-- Criação da tabela de empregadores
CREATE TABLE Empregadores (
    id_empregador INT PRIMARY KEY,
    nome_empregador VARCHAR(100),
    cnpj_empregador VARCHAR(14),
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);

-- Criação da tabela de empregados domésticos
CREATE TABLE Empregados (
    id_empregado INT PRIMARY KEY,
    nome_empregado VARCHAR(100),
    cpf_empregado VARCHAR(11),
    data_admissao DATE,
    id_empregador INT,
    FOREIGN KEY (id_empregador) REFERENCES Empregadores(id_empregador)
);

-- Criação da tabela de folha de pagamentos
CREATE TABLE FolhaPagamentos (
    id_folha INT PRIMARY KEY,
    id_empregado INT,
    mes_referencia DATE,
    valor_salario DECIMAL(10, 2),
    valor_inss DECIMAL(10, 2),
    valor_fgts DECIMAL(10, 2),
    FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);

-- Criação da tabela de afastamentos
CREATE TABLE Afastamentos (
    id_afastamento INT PRIMARY KEY,
    id_empregado INT,
    data_inicio DATE,
    data_fim DATE,
    motivo VARCHAR(200),
    FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);

-- Criação da tabela de Comunicação de Acidente de Trabalho (CAT)
CREATE TABLE CAT (
    id_cat INT PRIMARY KEY,
    id_empregado INT,
    data_acidente DATE,
    tipo_acidente VARCHAR(100),
    descricao VARCHAR(200),
    FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);

-- Criação da tabela de Aviso Prévio
CREATE TABLE AvisoPrevio (
    id_aviso_previo INT PRIMARY KEY,
    id_empregado INT,
    data_aviso DATE,
    FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);

-- Criação da tabela de Demissão
CREATE TABLE Demissao (
    id_demissao INT PRIMARY KEY,
    id_empregado INT,
    data_demissao DATE,
    FOREIGN KEY (id_empregado) REFERENCES Empregados(id_empregado)
);

INSERT INTO Empregadores (id_empregador, nome_empregador, cnpj_empregador, endereco, telefone) VALUES
(1, 'Empresa A', '12345678901234', 'Rua A, 123', '11111111'),
(2, 'Empresa B', '23456789012345', 'Rua B, 456', '22222222'),
(3, 'Empresa C', '34567890123456', 'Rua C, 789', '33333333'),
(4, 'Empresa D', '45678901234567', 'Rua D, 987', '44444444'),
(5, 'Empresa E', '56789012345678', 'Rua E, 654', '55555555');

INSERT INTO Empregados (id_empregado, nome_empregado, cpf_empregado, data_admissao, id_empregador) VALUES
(1, 'João', '12345678901', '2022-01-01', 1),
(2, 'Maria', '23456789012', '2022-02-01', 1),
(3, 'Pedro', '34567890123', '2022-03-01', 2),
(4, 'Ana', '45678901234', '2022-04-01', 2),
(5, 'Carlos', '56789012345', '2022-05-01', 3);

INSERT INTO FolhaPagamentos (id_folha, id_empregado, mes_referencia, valor_salario, valor_inss, valor_fgts) VALUES
(1, 1, '2022-01-01', 3000.00, 300.00, 270.00),
(2, 2, '2022-01-01', 2500.00, 250.00, 225.00),
(3, 3, '2022-01-01', 3500.00, 350.00, 315.00),
(4, 4, '2022-01-01', 2800.00, 280.00, 252.00),
(5, 5, '2022-01-01', 3200.00, 320.00, 288.00);

INSERT INTO Afastamentos (id_afastamento, id_empregado, data_inicio, data_fim, motivo) VALUES
(1, 1, '2022-02-01', '2022-02-05', 'Licença médica'),
(2, 2, '2022-03-01', '2022-03-05', 'Licença maternidade'),
(3, 3, '2022-04-01', '2022-04-05', 'Licença médica'),
(4, 4, '2022-05-01', '2022-05-05', 'Licença maternidade'),
(5, 5, '2022-06-01', '2022-06-05', 'Licença médica');

INSERT INTO CAT (id_cat, id_empregado, data_acidente, tipo_acidente, descricao) VALUES
(1, 1, '2022-03-15', 'Acidente de trabalho', 'Fratura no braço'),
(2, 2, '2022-04-15', 'Acidente de trabalho', 'Torção no tornozelo'),
(3, 3, '2022-05-15', 'Acidente de trabalho', 'Corte no dedo'),
(4, 4, '2022-06-15', 'Acidente de trabalho', 'Queimadura na mão'),
(5, 5, '2022-07-15', 'Acidente de trabalho', 'Lesão nas costas');

INSERT INTO AvisoPrevio (id_aviso_previo, id_empregado, data_aviso) VALUES
(1, 1, '2022-02-15'),
(2, 2, '2022-03-15'),
(3, 3, '2022-04-15'),
(4, 4, '2022-05-15'),
(5, 5, '2022-06-15');

INSERT INTO Demissao (id_demissao, id_empregado, data_demissao) VALUES
(1, 1, '2022-02-28'),
(2, 2, '2022-03-31'),
(3, 3, '2022-04-30'),
(4, 4, '2022-05-31'),
(5, 5, '2022-06-30');


-- 4.1.	Liste o nome do empregador e o nome do empregado que possuem o mesmo id_empregador.
-- Certo

SELECT 
	er.nome_empregador AS empregador,
    e.nome_empregado AS empregado
FROM
	empregados e
    INNER JOIN
    empregadores er ON e.id_empregador = er.id_empregador
ORDER BY empregador, empregado asc;


-- Outra maneira de fazer
SELECT 
	er.nome_empregador AS empregador,
    e.nome_empregado AS empregado
FROM
	empregadores er
    INNER JOIN
    empregados e ON e.id_empregador = er.id_empregador
ORDER BY empregador;

-- RESPOSTA
SELECT e.nome_empregador, d.nome_empregado
FROM Empregadores e
INNER JOIN Empregados d ON e.id_empregador = d.id_empregador; 


/* 4.2.	Exiba o nome do empregador, o nome do empregado e a 
   data de admissão do empregado para todos os registros da 
   tabela Empregados, mesmo que não haja correspondência com a tabela Empregadores. */
-- CERTO

SELECT 
	er.nome_empregador AS empregador,
    e.nome_empregado AS empregado,
    e.data_admissao AS 'data de admissão'
FROM 
	empregadores er
    RIGHT JOIN
    empregados e ON e.id_empregador = er.id_empregador;
    
-- RESPOSTA
SELECT e.nome_empregador, d.nome_empregado, d.data_admissao
FROM Empregados d
LEFT JOIN Empregadores e ON d.id_empregador = e.id_empregador;

    
/* 4.3. Liste o nome do empregador e o nome do empregado 
   apenas para os registros em que o empregado possui uma folha de pagamento. */
-- CERTO

SELECT * 
FROM folhapagamentos;
   
SELECT 
	er.nome_empregador AS empregador,
    e.nome_empregado AS empregado
FROM 
	folhapagamentos f
	INNER JOIN 
    empregados e ON f.id_folha = e.id_empregado
    INNER JOIN
    empregadores er ON er.id_empregador = e.id_empregador;

-- RESPOSTA
SELECT e.nome_empregador, d.nome_empregado
FROM Empregadores e
INNER JOIN Empregados d ON e.id_empregador = d.id_empregador
INNER JOIN FolhaPagamentos f ON d.id_empregado = f.id_empregado;

    
/* 4.4.	Exiba o nome do empregador e o nome do empregado 
   para todos os registros da tabela Empregadores, mesmo que 
   não haja correspondência com a tabela Empregados. */
-- CERTO

SELECT 
	nome_empregador AS empregador,
    nome_empregado AS empregado
FROM 
	empregadores er
    LEFT JOIN
    empregados e ON e.id_empregador = er.id_empregador;
    
-- RESPOSTA
SELECT e.nome_empregador, d.nome_empregado
FROM Empregadores e
LEFT JOIN Empregados d ON e.id_empregador = d.id_empregador;

    
/* 4.5.	Liste o nome do empregador, o nome do empregado e 
   mês de referência da folha de pagamento para todos os 
   registros da tabela FolhaPagamentos. */
-- CERTO
 
SELECT 
	nome_empregador AS empregador,
    nome_empregado AS empregado,
    mes_referencia AS 'mês de referência'
FROM
	folhapagamentos f 
    INNER JOIN 
    empregados e ON f.id_folha = e.id_empregado
    INNER JOIN 
    empregadores er ON er.id_empregador = e.id_empregador;

-- outra maneira

SELECT 
	nome_empregador AS empregador,
    nome_empregado AS empregado,
    mes_referencia AS 'mês de referência'
FROM
	folhapagamentos f 
    INNER JOIN 
    empregadores er ON f.id_folha = er.id_empregador
    INNER JOIN 
    empregados e ON er.id_empregador = e.id_empregado;

-- RESPOSTA 
SELECT e.nome_empregador, d.nome_empregado, f.mes_referencia
FROM Empregadores e
INNER JOIN Empregados d ON e.id_empregador = d.id_empregador
INNER JOIN FolhaPagamentos f ON d.id_empregado = f.id_empregado;


/* 4.6.	Exiba o nome do empregador, o nome do  empregado, 
   o cpf do empregado e o motivo de afastamento do empregado
   apenas para os registros em que o empregado possui um afastamento. */
-- CERTO

SELECT 
	nome_empregador AS empregador,
    nome_empregado AS empregado,
    cpf_empregado AS 'CPF do empregado',
    motivo
FROM
	afastamentos a
    INNER JOIN
	empregados e ON a.id_afastamento = e.id_empregado
    INNER JOIN 
    empregadores er ON e.id_empregador = er.id_empregador;

-- RESPOSTA 
SELECT e.nome_empregador, d.nome_empregado, d.cpf_empregado, a.motivo
FROM Empregadores e
INNER JOIN Empregados d ON e.id_empregador = d.id_empregador
INNER JOIN Afastamentos a ON d.id_empregado = a.id_empregado;
    

/* 4.7.	Liste o nome do empregador e o tipo de acidente do empregado
   apenas para os registros em que o empregado possui uma Comunicação de Acidente de Trabalho (CAT). */
-- 

SELECT * FROM cat;

SELECT 
	nome_empregador AS empregador,
    tipo_acidente AS 'Tipo do Acidente'
FROM 
	cat c
    INNER JOIN 
    empregados e ON e.id_empregado = c.id_cat
    INNER JOIN 
    empregadores er ON er.id_empregador = e.id_empregador;

-- RESPOSTA (NÃO TEM)


/* 4.8. Exiba o nome do empregador e a data de aviso do empregado 
   apenas para os registros em que o empregado possui um aviso prévio. */
-- CERTO 
   
SELECT 
	er.nome_empregador AS empregador,
    a.data_aviso AS 'data de aviso'
FROM 
	avisoprevio a
    INNER JOIN 
    empregados e ON a.id_aviso_previo = e.id_empregado
    INNER JOIN 
    empregadores er ON er.id_empregador = e.id_empregador;
    
-- RESPOSTA
SELECT e.nome_empregador, av.data_aviso
FROM Empregadores e
INNER JOIN Empregados d ON e.id_empregador = d.id_empregador
INNER JOIN AvisoPrevio av ON d.id_empregado = av.id_empregado;

    
/* 4.9. Liste o nome do empregador e a data de demissão do empregado
   apenas para os registros em que o empregado possui uma demissão registrada */
-- CERTO

SELECT * from demissao;

SELECT 
	er.nome_empregador AS empregador,
    d.data_demissao AS 'Data da demissão'
FROM
	demissao d
    INNER JOIN
    empregados e ON d.id_demissao = e.id_empregado
    INNER JOIN
    empregadores er ON e.id_empregador = er.id_empregador;
    
-- RESPOSTA
SELECT e.nome_empregador, dem.data_demissao
FROM Empregadores e
INNER JOIN Empregados d ON e.id_empregador = d.id_empregador
INNER JOIN Demissao dem ON d.id_empregado = dem.id_empregado;