-- Script de funciones, procedimientos almacenados para registrar elementos de la farmacia

-- Función para obtener el id de una marca a partir de su código
CREATE FUNCTION obtenerMarcaId(@codigoMarca VARCHAR(5))
RETURNS INTEGER
AS
BEGIN
	DECLARE @marcaId INTEGER;
	SET @marcaId = (SELECT Id FROM MarcasDeProductos WHERE Codigo LIKE @codigoMarca);
	RETURN @marcaId;
END;
GO

-- Función para obtener el id del tipo de producto a partir de su código
CREATE FUNCTION obtenerTipoId(@codigoTipo VARCHAR(5))
RETURNS INTEGER
AS
BEGIN
	DECLARE @tipoId INTEGER;
	SET @tipoId = (SELECT Id FROM TiposDeProductos WHERE Codigo LIKE @codigoTipo);
	RETURN @tipoId;
END;
GO

-- Función para obtener el id de la unidad de medida del contenido del producto a partir de su código
CREATE FUNCTION obtenerUnidadDeMedidaId(@codigoUnidadDeMedida VARCHAR(5))
RETURNS INTEGER
AS
BEGIN
	DECLARE @unidadId INTEGER
	SET @unidadId = (SELECT Id FROM UnidadesDeMedida WHERE Codigo LIKE @codigoUnidadDeMedida);
	RETURN @unidadId;
END;
GO

-- Función para obtener el id de la categoría de un producto a partir de su código
CREATE FUNCTION obtenerCategoriaId(@codigoCategoria VARCHAR(5))
RETURNS INTEGER
AS
BEGIN
	DECLARE @categoriaId INTEGER
	SET @categoriaId = (SELECT Id FROM CategoriasDeProductos WHERE Codigo LIKE @codigoCategoria);
	RETURN @categoriaId;
END;
GO

-- Procedimiento almacenado para registrar un producto
CREATE PROCEDURE registrarProductoFarmacia
	@idProducto VARCHAR(19),
	@nombreComercial VARCHAR(50),
	@tipoCode VARCHAR(5),
	@marcaCode VARCHAR(5),
	@unidadMedidaCode VARCHAR(5),
	@cantidadContenido DECIMAL(13,2)
AS
BEGIN
	DECLARE @tipoId INTEGER;
	DECLARE @marcaId INTEGER;
	DECLARE @unidadDeMedidaId INTEGER;
	SET @tipoId = dbo.obtenerTipoId(@tipoCode);
	SET @marcaId = dbo.obtenerMarcaId(@marcaCode);
	SET @unidadDeMedidaId = dbo.obtenerUnidadDeMedidaId(@unidadMedidaCode);
	INSERT INTO Productos(Id,NombreComercial,TipoId,MarcaId,UnidadMedidaId,CantidadContenido) VALUES (@idProducto,@nombreComercial,@tipoId,@marcaId,@unidadDeMedidaId,@cantidadContenido);
END;
GO

-- Procedimiento almacenado para registrar la categoría de un producto.
CREATE PROCEDURE registrarCategoriaDeProducto
	@idProducto VARCHAR(19),
	@categoriaCode VARCHAR(5)
AS
BEGIN
	DECLARE @categoriaId INTEGER;
	SET @categoriaId = dbo.obtenerCategoriaId(@categoriaCode);
	INSERT INTO ProductosCategorias (ProductoId,CategoriaId) VALUES (@idProducto,@categoriaId);
END;
GO