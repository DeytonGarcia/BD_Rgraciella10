-- Para ver la versión q estamos utilizando
SELECT * FROM V$VERSION;

-- Ver usuarios de la instancia de base de datos
SELECT username FROM DBA_USERS;

-- Creación de Uusario Restaurante De Graciella
CREATE USER Rgraciella IDENTIFIED BY DeytonPaolo0204A;

-- Privilegios 
…ALTER TABLE Rgraciella.reservation_detail
ADD CONSTRAINT chk_cantidad CHECK (cantidad > 0);

-- Evita que el precio unitario sea negativo
ALTER TABLE Rgraciella.reservation_detail
ADD CONSTRAINT chk_precio_unitario CHECK (precio_unitario >= 0);


