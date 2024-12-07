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
INSERT INTO TiposDeProductos (Nombre,Codigo,Activo,UnidadMedidaId) VALUES ('Aerosol','aersl',1,1);
INSERT INTO TiposDeProductos (Nombre,Codigo,Activo,UnidadMedidaId) VALUES ('Sobre granulado','grnld',1,3);
GO

-- Llenado de las marcas de productos
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('PulmoGrip','plmgr',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Bayer','bayer',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Pfizer','pfizr',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Genérico','gnric',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Acofarma','acfrm',1);
INSERT INTO MarcasDeProductos (Nombre,Codigo,Activo) VALUES ('Corinfar','crfar',1);
GO

--Llenado de tipos de movimientos
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Entrada',1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Salida',-1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Producto dañado',-1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Producto vencido',-1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Producto robado',-1);
INSERT INTO TipoDeMovimientos (Nombre,Factor) VALUES ('Producto devuelto',1);
GO