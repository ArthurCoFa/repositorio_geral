create database auditoria;
use auditoria;

create table log_consultas(
id_log int auto_increment primary key,
id_consulta int not null,
acao varchar(200),
data_log datetime,
usuario varchar(200) );

CREATE TABLE Consultas (
id_consulta INT AUTO_INCREMENT PRIMARY KEY,
data_consulta date,
descricao VARCHAR(255) );

DELIMITER //
CREATE TRIGGER trg_depois_insert_consulta
AFTER INSERT ON Consultas
FOR EACH ROW
BEGIN
INSERT INTO
Log_Consultas (id_consulta, acao, data_log, usuario)
VALUES (NEW.id_consulta, 'INSERT', NOW(), USER());
END;
// DELIMITER ;

select * from consultas;
insert into consultas(data_consulta,descricao) values('2025-8-27','teste de inserção');
select * from log_consultas;

DELIMITER //
CREATE TRIGGER trg_antes_insert_consulta
BEFORE INSERT ON Consultas
FOR EACH ROW
BEGIN
 IF NEW.data_consulta > CURDATE() + INTERVAL 1 YEAR THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = 'Data da consulta muito distante';
 END IF;
END;
// DELIMITER ;

insert into consultas(data_consulta,descricao) values('2036-8-27','teste de inserção');

DROP TRIGGER nome_da_trigger;

DELIMITER //
CREATE TRIGGER trg_after_update_consulta
AFTER UPDATE ON Consultas
FOR EACH ROW
BEGIN
 INSERT INTO Log_Consultas(id_consulta, acao, data_log,
usuario)
 VALUES (NEW.id_consulta, 'UPDATE', NOW(), USER());
END;
// DELIMITER ;

select * from consultas;

UPDATE Consultas
SET descricao = 'Descrição alterada'
WHERE id_consulta = 1;

select * from Log_Consultas;

ALTER TABLE Consultas
DROP COLUMN descricao,
ADD COLUMN status VARCHAR(20),
ADD COLUMN autorizada BOOLEAN;

DELIMITER //
CREATE TRIGGER trg_before_update_consulta
BEFORE UPDATE ON Consultas
FOR EACH ROW
BEGIN
 -- Verifica se a consulta já estava autorizada ANTES do update
 IF OLD.autorizada = TRUE THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = 'Consulta já autorizada pela operadora.';
 END IF;
END;
// DELIMITER ;

INSERT INTO
Consultas (id_consulta, data_consulta, status, autorizada)
VALUES (2, '2025-04-25', 'Agendada', FALSE);

UPDATE Consultas
SET autorizada = TRUE
WHERE id_consulta = 2;

UPDATE Consultas
SET status = 'Concluída'
WHERE id_consulta = 2;

UPDATE Consultas
SET autorizada = FALSE
WHERE id_consulta = 2;

delimiter //
CREATE TRIGGER trg_after_delete_consulta
AFTER DELETE ON Consultas
FOR EACH ROW
BEGIN
 INSERT INTO Log_Consultas(id_consulta, acao, data_log, usuario)
 VALUES (OLD.id_consulta, 'DELETE', NOW(), USER());
END;
// delimiter ;

select * from consultas;

INSERT INTO
Consultas (id_consulta, data_consulta, status, autorizada)
VALUES (4, '2025-04-25', 'Agendada', FALSE);

delete from consultas where id_consulta = 4;
select * from Log_Consultas;

SHOW TRIGGERS FROM auditoria;