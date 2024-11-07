-- Para ver la versión q estamos utilizando
SELECT * FROM V$VERSION;

-- Ver usuarios de la instancia de base de datos
SELECT username FROM DBA_USERS;

-- Creación de Uusario Restaurante De Graciella
CREATE USER Rgraciella IDENTIFIED BY DeytonPaolo0204A;

-- Usuarios
SELECT * FROM DBA_USERS;

-- Privilegios 
GRANT CREATE SESSION TO Rgraciella;
GRANT CREATE TABLE TO Rgraciella;
GRANT CREATE VIEW TO Rgraciella;
GRANT CREATE PROCEDURE TO Rgraciella;
GRANT CREATE TRIGGER TO Rgraciella;
GRANT CREATE SEQUENCE TO Rgraciella;
GRANT CREATE SYNONYM TO Rgraciella;
GRANT UNLIMITED TABLESPACE TO Rgraciella;
