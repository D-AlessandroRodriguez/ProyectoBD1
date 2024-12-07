INSERT INTO Roles (Nombre, Codigo, Activo) VALUES ('Administrador', 'ADM', 1);
INSERT INTO Roles (Nombre, Codigo, Activo) VALUES ('Editor', 'EDT', 1);
INSERT INTO Roles (Nombre, Codigo, Activo) VALUES ('UsuarioEstandar', 'UE', 1);
INSERT INTO Roles (Nombre, Codigo, Activo) VALUES ('Invitado', 'INV', 1);

SELECT * FROM Roles
GO

INSERT INTO Permisos (Nombre, Codigo, Activo) VALUES ('Crear', 'C', 1);
INSERT INTO Permisos (Nombre, Codigo, Activo) VALUES ('Actualizar', 'A', 1);
INSERT INTO Permisos (Nombre, Codigo, Activo) VALUES ('Eliminar', 'E', 1);
INSERT INTO Permisos (Nombre, Codigo, Activo) VALUES ('Leer', 'L', 1);

SELECT * FROM Permisos
GO

INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (1, 1);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (1, 2);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (1, 3);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (1, 4);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (2, 1);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (2, 2);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (2, 3);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (3, 1);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (3, 4);
INSERT INTO RolesPermisos (RolId, PermisoId) VALUES (4, 1);

SELECT * FROM RolesPermisos
GO


INSERT INTO Cargos (Nombre, Codigo, Activo) VALUES ('Medico', 'M', 1);
INSERT INTO Cargos (Nombre, Codigo, Activo) VALUES ('Enfermero', 'E', 1);
INSERT INTO Cargos (Nombre, Codigo, Activo) VALUES ('Administrador', 'A', 1);
INSERT INTO Cargos (Nombre, Codigo, Activo) VALUES ('Cajero', 'C', 1);
INSERT INTO Cargos (Nombre, Codigo, Activo) VALUES ('Recepcionista', 'R', 1);
INSERT INTO Cargos (Nombre, Codigo, Activo) VALUES ('Atencion al cliente', 'AC', 1);
INSERT INTO Cargos (Nombre, Codigo, Activo) VALUES ('Jefe de Recursos Humanos', 'JRH', 1);

SELECT * FROM Cargos
GO

INSERT INTO DepartamentosHospital (Nombre, Código, Activo) VALUES ('Salud', 'S', 1);
INSERT INTO DepartamentosHospital (Nombre, Código, Activo) VALUES ('Recursos humanos', 'RRHH', 1);
INSERT INTO DepartamentosHospital (Nombre, Código, Activo) VALUES ('Contabilidad', 'C', 1);
INSERT INTO DepartamentosHospital (Nombre, Código, Activo) VALUES ('Operaciones', 'O', 1);

SELECT * FROM DepartamentosHospital
GO

INSERT INTO Especialidades (Nombre, Codigo, Activo) VALUES ('Medicina general', 'MG', 1);
INSERT INTO Especialidades (Nombre, Codigo, Activo) VALUES ('Neurología', 'NEU', 1);
INSERT INTO Especialidades (Nombre, Codigo, Activo) VALUES ('Cardiología', 'CAR', 1);
INSERT INTO Especialidades (Nombre, Codigo, Activo) VALUES ('Ginecología', 'GIN', 1);
INSERT INTO Especialidades (Nombre, Codigo, Activo) VALUES ('Pediatría', 'PED', 1);
INSERT INTO Especialidades (Nombre, Codigo, Activo) VALUES ('Ninguna', 'NIN', 1);

SELECT * FROM Especialidades
GO

INSERT INTO Paises (Nombre, Codigo, Activo) VALUES ('Honduras', 'HN', 1);
INSERT INTO Paises (Nombre, Codigo, Activo) VALUES ('El Salvador', 'ES', 1);
INSERT INTO Paises (Nombre, Codigo, Activo) VALUES ('Guatemala', 'GUA', 1);
INSERT INTO Paises (Nombre, Codigo, Activo) VALUES ('Panamá', 'PAN', 1);

SELECT * FROM Paises
GO

INSERT INTO Departamentos (PaisId, Nombre, Activo) VALUES (1, 'Francisco Morazán', 1);
INSERT INTO Departamentos (PaisId, Nombre, Activo) VALUES (1, 'Comayagua', 1);
INSERT INTO Departamentos (PaisId, Nombre, Activo) VALUES (1, 'Copán', 1);
INSERT INTO Departamentos (PaisId, Nombre, Activo) VALUES (2, 'San Salvador', 1);
INSERT INTO Departamentos (PaisId, Nombre, Activo) VALUES (2, 'Santa Ana', 1);
INSERT INTO Departamentos (PaisId, Nombre, Activo) VALUES (3, 'Alta Verapaz', 1);
INSERT INTO Departamentos (PaisId, Nombre, Activo) VALUES (4, 'Chiriquí', 1);

SELECT * FROM Departamentos;

INSERT INTO Ciudades (DepartamentoId, Nombre, Activo) VALUES (4, 'Aguilares', 1);
INSERT INTO Ciudades (DepartamentoId, Nombre, Activo) VALUES (4, 'Apopa', 1);
INSERT INTO Ciudades (DepartamentoId, Nombre, Activo) VALUES (4, 'Ayutuxtepeque', 1);

INSERT INTO Ciudades (DepartamentoId, Nombre, Activo) VALUES (1, 'Alubarén', 1);
INSERT INTO Ciudades (DepartamentoId, Nombre, Activo) VALUES (1, 'Cantarranas', 1);
INSERT INTO Ciudades (DepartamentoId, Nombre, Activo) VALUES (1, 'Cedros', 1);
INSERT INTO Ciudades (DepartamentoId, Nombre, Activo) VALUES (1, 'Distrito Central', 1);

SELECT * FROM Ciudades;

INSERT INTO Colonias (CiudadId,Nombre,Activo) VALUES (7, 'John F. Kennedy', 1);
INSERT INTO Colonias (CiudadId,Nombre,Activo) VALUES (7, 'Canaán', 1);
INSERT INTO Colonias (CiudadId,Nombre,Activo) VALUES (7, 'Divanna', 1);
INSERT INTO Colonias (CiudadId,Nombre,Activo) VALUES (7, 'Los Pinos', 1);
INSERT INTO Colonias (CiudadId,Nombre,Activo) VALUES (7, 'Modesto Rodas Alvarado', 1);
INSERT INTO Colonias (CiudadId,Nombre,Activo) VALUES (7, 'Nueva Suyapa', 1);

SELECT * FROM Empleados
GO

CREATE VIEW VistaEmpleados AS
SELECT p.Id, p.N1, p.AP1, d.Nombre AS NombreDepartamento, c.Nombre AS Cargo, e.Correo
FROM Personas p
INNER JOIN Empleados e ON p.Id = e.PersonaId
INNER JOIN DepartamentosHospital d ON e.DepartamentoId = d.Id
INNER JOIN Cargos c ON e.CargoId = c.Id;
GO

SELECT * FROM VistaEmpleados
GO


CREATE VIEW VistaPacientes AS
SELECT p.Id AS PersonaId, p.N1 AS PrimerNombre, p.AP1 AS PrimerApellido,
p.DNI, t.Id AS Telefono, Ex.Id Expediente
FROM Personas p
INNER JOIN Telefonos t ON t.PersonaId = p.Id
INNER JOIN Pacientes pa ON pa.PersonaId = p.Id
INNER JOIN Expedientes Ex ON Ex.PacienteId = pa.Id;
GO

SELECT * FROM VistaPacientes
GO