-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS ReservaLeitosHospital;
USE ReservaLeitosHospital;

-- Tabela de Pacientes
CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) 
);

-- Tabela de Leitos
CREATE TABLE Leitos (
    id_leito INT PRIMARY KEY AUTO_INCREMENT,
    numero_quarto INT NOT NULL,
    tipo VARCHAR(50) -- Ex: UTI, Enfermaria, etc.
);

-- Tabela de Reservas
CREATE TABLE Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT,
    id_leito INT,
    data_reserva DATE,
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_leito) REFERENCES Leitos(id_leito)
);


-- Inserção de dados de exemplo
INSERT INTO Pacientes (nome, data_nascimento, email) VALUES
    ('Ana Silva', '1990-05-15', 'ana.silva@email.com'),
    ('Bruno Pereira', '1985-10-23', 'bruno.pereira@email.com'),
    ('Carla Rodrigues', '2000-02-01', 'carla.rodrigues@email.com'),
    ('Mariana Souza', '1988-07-21', 'mariana.souza@email.com'), 
    ('Rafael Almeida', '1995-03-10', 'rafael.almeida@email.com'), 
    ('Juliana Castro', '1982-11-05', 'juliana.castro@email.com'), 
    ('Gustavo Lima', '2001-09-18', 'gustavo.lima@email.com'), 
    ('Beatriz Nunes', '1979-06-30', 'beatriz.nunes@email.com');

INSERT INTO Pacientes (nome, data_nascimento) VALUES
    ('Fulano de Tal', '1975-09-18'), 
    ('Beltrano de Tal', '1982-06-30');

INSERT INTO Leitos (numero_quarto, tipo) VALUES
    (101, 'Enfermaria'),
    (102, 'UTI'),
    (201, 'Enfermaria'),
    (202, 'UTI'), 
    (301, 'Enfermaria'), 
    (302, 'UTI'), 
    (401, 'Pediátrico'), 
    (402, 'Pediátrico');

INSERT INTO Reservas (id_paciente, id_leito, data_reserva) VALUES
    (1, 7, '2023-11-01'),
    (2, 2, '2023-11-05'),
    (3, 2, '2023-11-10'),
    (4, 2, '2023-11-15'), 
    (5, 5, '2023-11-20'), 
    (6, 7, '2023-11-25'), 
    (7, 7, '2023-11-30'), 
    (8, 8, '2023-12-01');

/* 1.	View básica de pacientes
Crie uma view chamada vw_pacientes_emails que exiba apenas os nomes e os e-mails de todos os pacientes. */
CREATE VIEW vw_pacientes_emails AS
SELECT 
	p.nome,
    p.email
FROM
	pacientes p;
    
SELECT * FROM vw_pacientes_emails;

/* 2.	View de leitos disponíveis
Crie uma view vw_leitos que mostre o número do quarto e o tipo de todos os leitos cadastrados, ordenados por número do quarto. */
CREATE VIEW vw_leitos AS
SELECT 	
	numero_quarto,
    tipo
FROM
	leitos l
ORDER BY numero_quarto ASC;

SELECT * FROM vw_leitos;

/* 3.	View de reservas completas
Crie uma view vw_reservas_completas que exiba o nome do paciente, o número do quarto, o tipo do leito e a data da reserva. */
CREATE OR REPLACE VIEW vw_reservas_completas AS
SELECT
	p.nome,
    l.numero_quarto,
    l.tipo,
    r.data_reserva
FROM
	pacientes p
    JOIN
	reservas r ON r.id_paciente = p.id_paciente
    JOIN
    leitos l ON l.id_leito = r.id_leito;

/* Outra forma de fazer */
CREATE OR REPLACE VIEW vw_reservas_completas AS
SELECT
	p.nome,
    l.numero_quarto,
    l.tipo,
    r.data_reserva
FROM
	reservas r
    JOIN
    leitos l ON l.id_leito = r.id_leito
    JOIN
	pacientes p ON r.id_paciente = p.id_paciente;
    
SELECT * FROM vw_reservas_completas;

/* 4.	View de reservas por tipo de leito
Crie uma view vw_reservas_por_tipo que exiba o tipo de leito e o número total de reservas realizadas para cada tipo. */
CREATE OR REPLACE VIEW vw_reservas_por_tipo AS
SELECT
	l.tipo,
    COUNT(r.id_reserva) AS numero_reservas
FROM
	leitos l
    JOIN 
    reservas r ON r.id_leito = l.id_leito
GROUP BY l.tipo;

SELECT * FROM vw_reservas_por_tipo;

/* 5.	View de leitos mais reservados
Crie uma view vw_leitos_populares que exiba os IDs dos leitos e a quantidade de reservas feitas para cada um, ordenados do mais reservado para o menos reservado. */
CREATE OR REPLACE VIEW vw_leitos_populares AS
SELECT 
	l.id_leito,
    COUNT(r.id_reserva) AS numero_reservas
FROM 
	leitos l
    JOIN
    reservas r ON r.id_leito= l.id_leito
GROUP BY id_leito
ORDER BY numero_reservas desc;

SELECT * FROM vw_leitos_populares;

/* 6. View de pacientes pediátricos
Crie uma view vw_pacientes_pediatricos que mostre o nome e a data de reserva dos pacientes que utilizaram leitos do tipo "Pediátrico" */
CREATE OR REPLACE VIEW vw_pacientes_pediatricos AS
SELECT	
	p.nome,
    r.data_reserva	/*,
    l.tipo*/
FROM
	pacientes p
    JOIN 
    reservas r ON r.id_paciente = p.id_paciente
    JOIN
    leitos l ON l.id_leito = r.id_leito
WHERE
	l.tipo = "pediatrico";
    
SELECT * FROM vw_pacientes_pediatricos;

/* 7. View de pacientes sem e-mail
Crie uma view vw_pacientes_sem_email que mostre os pacientes cujo campo de email está vazio ou nulo. */
SELECT * FROM PACIENTES;

CREATE OR REPLACE VIEW vw_pacientes_sem_email AS
SELECT
	p.id_paciente,
    p.nome
FROM
	pacientes p
WHERE
	p.email IS NULL;
    
SELECT * FROM vw_pacientes_sem_email;

/* 8. View de pacientes com nome iniciando em 'M'
Crie uma view vw_pacientes_m que liste apenas os pacientes cujo nome começa com a letra "M" */
CREATE OR REPLACE VIEW vw_pacientes_m AS
SELECT
	id_paciente,
    nome
FROM
	pacientes p 
WHERE nome LIKE 'm%';
    
SELECT * FROM vw_pacientes_m;

/* 9. View de reservas agrupadas por tipo de quarto
Crie uma view vw_total_por_tipo que mostre o tipo de leito e o total de pacientes que já o reservaram. */
CREATE OR REPLACE VIEW vw_total_por_tipo AS
SELECT 
	l.tipo,
    COUNT(p.id_paciente) AS total_pacientes
FROM
	pacientes p
    JOIN
	reservas r ON r.id_paciente = p.id_paciente
    JOIN
	leitos l ON l.id_leito = r.id_leito
GROUP BY l.tipo;

SELECT * FROM vw_total_por_tipo;

/* 10. Atualizar view com coluna adicional
Altere a view vw_reservas_completas para incluir a data de nascimento do paciente. */
CREATE OR REPLACE VIEW vw_reservas_completas AS
SELECT
	p.nome,
	p.data_nascimento,
    l.numero_quarto,
    l.tipo,
    r.data_reserva
FROM
	reservas r
    JOIN
    leitos l ON l.id_leito = r.id_leito
    JOIN
	pacientes p ON r.id_paciente = p.id_paciente;
    
SELECT * FROM vw_reservas_completas;

/* 11. Substituir view de pacientes pediátricos 
Modifique a view vw_pacientes_pediatricos para que também exiba o número do quarto pediátrico reservado. */
CREATE OR REPLACE VIEW vw_pacientes_pediatricos AS
SELECT	
	p.nome,
    r.data_reserva,
    l.numero_quarto
FROM
	pacientes p
    JOIN 
    reservas r ON r.id_paciente = p.id_paciente
    JOIN
    leitos l ON l.id_leito = r.id_leito
WHERE
	l.tipo = "pediatrico";
    
SELECT * FROM vw_pacientes_pediatricos;

/* 12. Atualizar view de leitos populares
Atualize a view vw_leitos_populares para exibir também o tipo do leito associado. */
CREATE OR REPLACE VIEW vw_leitos_populares AS
SELECT 
	l.id_leito,
    COUNT(r.id_reserva) AS numero_reservas,
    l.tipo
FROM 
	leitos l
    JOIN
    reservas r ON r.id_leito= l.id_leito
GROUP BY id_leito
ORDER BY numero_reservas desc;

SELECT * FROM vw_leitos_populares;