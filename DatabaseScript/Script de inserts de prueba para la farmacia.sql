-- Llenado de catálogos y tablas pertenecientes a la farmacia

-- Llenando categorías de productos
INSERT INTO CategoriasDeProductos (Nombre,Codigo,Activo) VALUES ('Antihistamínico','anthm',1);
INSERT INTO CategoriasDeProductos (Nombre,Codigo,Activo) VALUES ('Expectorante','expct',1);
INSERT INTO CategoriasDeProductos (Nombre,Codigo,Activo) VALUES ('Analgésico','anlgs',1);
INSERT INTO CategoriasDeProductos (Nombre,Codigo,Activo) VALUES ('Anti-inflamatorio','atinf',1);
INSERT INTO CategoriasDeProductos (Nombre,Codigo,Activo) VALUES ('Laxante','lxnte',1);
GO

-- Llenado de la unidades de medida
INSERT INTO UnidadesDeMedida (Nombre,Codigo,Activo) VALUES ('Mililitro(s)','ml',1);
INSERT INTO UnidadesDeMedida (Nombre,Codigo,Activo) VALUES ('Unidad(es)','unid',1);
INSERT INTO UnidadesDeMedida (Nombre,Codigo,Activo) VALUES ('Miligramo(s)','mg',1);
INSERT INTO UnidadesDeMedida (Nombre,Codigo,Activo) VALUES ('Pastilla(s)','pstll',1);
INSERT INTO UnidadesDeMedida (Nombre,Codigo,Activo) VALUES ('Sobres','sbrs',1);
GO

-- Llenado de tipos de productos
INSERT INTO TiposDeProductos (Nombre,Codigo,Activo,UnidadMedidaId) VALUES ('Tableta','tblta',1,3);
INSERT INTO TiposDeProductos (Nombre,Codigo,Activo,UnidadMedidaId) VALUES ('Cápsula','cpsla',1,3);
INSERT INTO TiposDeProductos (Nombre,Codigo,Activo,UnidadMedidaId) VALUES ('Jarabe','jarbe',1,1);
INSERT INTO TiposDeProductos (Nombre,Codigo,Activo,UnidadMedidaId) VALUES ('Inyectable','inyct',1,1);
INSERT INTO TiposDeProductos (Nombre,Codigo,Activo,UnidadMedidaId) VALUES ('Aerosol','aersl',1,2);
INSERT INTO TiposDeProductos (Nombre,Codigo,Activo,UnidadMedidaId) VALUES ('Granulado','grnld',1,5);
GO

-- Llenado de las marcas de productos
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('PulmoGrip','plmgr',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Bayer','bayer',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Pfizer','pfizr',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Genérico','gnric',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Acofarma','acfrm',1);
GO

SELECT TP.Id,TP.Nombre,U.Id,U.Nombre FROM TiposDeProductos AS TP INNER JOIN UnidadesDeMedida U ON U.Id = TP.UnidadMedidaId;
GO

-- Llenado de tabla de productos
INSERT INTO Productos (Id,NombreComercial,TipoId,MarcaId,UnidadMedidaId,CantidadContenido) VALUES ('P-20241130124745787','Acetaminofén 500 MG',7,2,3,30);
INSERT INTO Productos (Id,NombreComercial,TipoId,MarcaId,UnidadMedidaId,CantidadContenido) VALUES ('P-20241130124751098','Rocefort',10,3,1,5);
GO

--Llenado de tipos de movimientos
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Entrada',1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Salida',-1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Producto dañado',-1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Producto vencido',-1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Producto robado',-1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Producto devuelto',1);
GO

-- Llenado de ejemplo de lotes
INSERT INTO LotesProductos (Id,ProductoId,FechaIngreso,FechaElab,FechaVencimiento,CantidadIngresada,CantidadActual) VALUES ('L-20241130012854673','P-20241130124745787','2024-11-30','2024-11-26','2025-05-07',40,40);
INSERT INTO LotesProductos (Id,ProductoId,FechaIngreso,FechaElab,FechaVencimiento,CantidadIngresada,CantidadActual) VALUES ('L-20241130012854433','P-20241130124751098','2024-11-30','2024-11-20','2025-10-25',63,63);
GO

-- Llenado de ejemplo de ficha inventario
INSERT INTO FichaInventario(Id,Fecha,TipoMovimientoId,ProductoId,Cantidad,LoteId) VALUES ('M-20241130013645678','2024-11-30',1,'P-20241130124745787',40,'L-20241130012854673');
INSERT INTO FichaInventario(Id,Fecha,TipoMovimientoId,ProductoId,Cantidad,LoteId) VALUES ('M-20241130013645345','2024-11-30',1,'P-20241130124751098',63,'L-20241130012854433');
INSERT INTO FichaInventario(Id,Fecha,TipoMovimientoId,ProductoId,Cantidad,LoteId) VALUES ('M-20241130013645653','2024-11-30',2,'P-20241130124751098',5,'L-20241130012854433');
UPDATE LotesProductos SET CantidadActual = 58 WHERE ProductoId LIKE 'P-20241130124751098';
GO