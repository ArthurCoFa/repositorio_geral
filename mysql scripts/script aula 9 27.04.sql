CREATE USER 'fulano_de_tal'@'127.0.0.1' IDENTIFIED BY 'senha123456';

CREATE USER 'beltrano_de_tal'@'127.0.0.1' IDENTIFIED BY 'senha123456';

DROP USER 'beltrano_de_tal'@'127.0.0.1';

SELECT USER FROM MYSQL.USER;

SELECT USER();

GRANT ALL PRIVILEGES ON *.* TO 'fulano_de_tal'@'127.0.0.1' WITH GRANT OPTION;

GRANT SELECT, DELETE
ON db_company.*
to 'beltrano_de_tal'@'127.0.0.1';

SHOW GRANTS FOR 'beltrano_de_tal'@'127.0.0.1';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'fulano_de_tal'@'127.0.0.1';

create user 'ana_maria'@'127.0.0.1' IDENTIFIED BY 'senha123';
create user 'antonio_carlos'@'127.0.0.1' IDENTIFIED BY 'senha456';
GRANT ALL PRIVILEGES ON VendaIngressosDB.* TO 'ana_maria'@'127.0.0.1';
GRANT ALL PRIVILEGES ON VendaIngressosDB.* TO 'antonio_carlos'@'127.0.0.1';

