
CREATE TRIGGER afterInsertsProducts
ON Productos
AFTER INSERT
AS
BEGIN
    INSERT INTO LogProductos (ProductoId, Nombre, Fecha)
    SELECT Id, NombreComercial, GETDATE()
    FROM INSERTED;
END;