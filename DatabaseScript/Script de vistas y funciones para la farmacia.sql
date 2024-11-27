i-- Vistas del farmacéutico

--Ver información de los productos
CREATE VIEW VistaProductos
AS
SELECT P.Id id,
P.NombreComercial nombre,
M.Nombre marca,
T.Nombre tipo,
P.CantidadContenido contenido,
U.Nombre unidad,
SUM(F.Cantidad*TM.Factor) stock
FROM Productos P
INNER JOIN MarcasDeProductos M
ON P.MarcaId = M.Id
INNER JOIN TiposDeProductos T
ON P.TipoId = T.Id
INNER JOIN UnidadesDeMedida U
ON P.UnidadMedidaId = U.Id
INNER JOIN FichaInventario F
ON P.Id = F.ProductoId
INNER JOIN TipoDeMovimientos TM
ON F.TipoMovimientoId = TM.Id
GROUP BY P.Id,P.NombreComercial,M.Nombre,T.Nombre,P.CantidadContenido,U.Nombre;
GO

-- Ver información de las órdenes de recetas.
CREATE VIEW VistaRecetas
AS
SELECT Ord.Id id,
(Pers.N1+' '+Pers.AP1) paciente,
(Pers.N1+' '+Pers.AP1) medico,
Ord.Fecha fecha,
Ord.Id accion
FROM OrdenRecetas Ord
INNER JOIN Expedientes Ex
ON Ord.ExpedienteId = Ex.Id
INNER JOIN Pacientes Pac
ON Ex.PacienteId = Pac.Id
INNER JOIN Personas Pers
ON Pac.PersonaId = Pers.Id
INNER JOIN Empleados empl
ON Pers.Id = empl.Id
INNER JOIN Medicos med
ON empl.Id = med.EmpleadoId;
GO

--Obtener los productos médicos que conforman una receta. 
CREATE FUNCTION obtenerProductosDeReceta(@recetaId INTEGER)
RETURNS TABLE
AS
RETURN(
SELECT OrdRecProd.RecetaId id,
Prod.NombreComercial nombre,
M.Nombre marca,
T.Nombre tipo,
OrdRecProd.CantProductos cantidad,
OrdRecProd.CantDosis cantidadDosis,
U.Nombre unidad,
OrdRecProd.FrecuenciaHoras frecuencia
FROM OrdenRecetasProductos OrdRecProd
INNER JOIN Productos prod
ON OrdRecProd.ProductoId = prod.Id
INNER JOIN MarcasDeProductos M
ON prod.MarcaId = M.Id
INNER JOIN TiposDeProductos T
ON prod.TipoId = T.Id
INNER JOIN UnidadesDeMedida U
ON OrdRecProd.UnidadMedidaId = U.Id
WHERE OrdRecProd.RecetaId = @recetaId
);
GO

--Obtener los lotes de un producto
CREATE FUNCTION obtenerLotesDeProducto(@productoId VARCHAR(19))
RETURNS TABLE
AS
RETURN(
SELECT L.Id id,
L.CantidadIngresada,
L.FechaIngreso,
L.FechaElab FechaElaboracion,
L.FechaVencimiento,
L.CantidadActual
FROM LotesProductos AS L
WHERE L.ProductoId LIKE @productoId
);
GO

--Ver historial de movimientos de productos
CREATE VIEW VistaMovimientosProductos
AS
SELECT F.Id id,
Prod.NombreComercial producto,
M.Nombre marca,
TProd.Nombre tipo,
L.Id lote,
TM.Nombre movimiento,
F.Cantidad cantidad,
F.Fecha fecha
FROM FichaInventario F
INNER JOIN Productos Prod
ON F.ProductoId = Prod.Id
INNER JOIN MarcasDeProductos M
ON Prod.MarcaId = M.Id
INNER JOIN TiposDeProductos TProd
ON Prod.TipoId = TProd.Id
INNER JOIN LotesProductos L
ON F.LoteId = L.Id
INNER JOIN TipoDeMovimientos TM
ON F.TipoMovimientoId = TM.Id;
GO