-- Script de funciones y procedimientos almacenados para registrar un lote y su correspondiente movimiento en el inventario

-- Procedimiento almacenado para registrar un lote.
CREATE PROCEDURE registrarLote
	@idLote VARCHAR(19),
	@idProducto VARCHAR(19),
	@fechaIngreso DATE,
	@fechaElab DATE,
	@fechaVencimiento DATE,
	@cantidadIngresada INTEGER,
	@cantidadActual INTEGER
AS
BEGIN
	INSERT INTO LotesProductos (Id,ProductoId,FechaIngreso,FechaElab,FechaVencimiento,CantidadIngresada,CantidadActual) VALUES (@idLote,@idProducto,@fechaIngreso,@fechaElab,@fechaVencimiento,@cantidadIngresada,@cantidadActual);
END;
GO

-- Procedimiento almacenado para registrar un movimiento en el inventario.
CREATE PROCEDURE registrarMovimientoInventario
	@idMovimiento VARCHAR(19),
	@fecha DATE,
	@idTipoMovimiento INTEGER,
	@idProducto VARCHAR(19),
	@cantidad INTEGER,
	@idLote VARCHAR(19)
AS
BEGIN
	INSERT INTO FichaInventario (Id,Fecha,TipoMovimientoId,ProductoId,Cantidad,LoteId) VALUES (@idMovimiento,@fecha,@idTipoMovimiento,@idProducto,@cantidad,@idLote);
END;
GO