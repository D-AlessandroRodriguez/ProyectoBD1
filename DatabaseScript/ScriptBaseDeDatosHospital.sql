CREATE DATABASE HospitalDatabase;
GO

USE HospitalDatabase;
GO

CREATE TABLE Paises(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(250) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
ACTIVO BIT NOT NULL);
GO

CREATE TABLE Departamentos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
PaisId INTEGER NOT NULL REFERENCES Paises(Id),
Nombre VARCHAR(250) NOT NULL,
Activo BIT NOT NULL,
UNIQUE(Id,PaisId),
UNIQUE(PaisId,Nombre));
GO

CREATE TABLE Ciudades(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
DepartamentoId INTEGER NOT NULL REFERENCES Departamentos(Id),
Nombre VARCHAR(250) NOT NULL,
Activo BIT NOT NULL,
UNIQUE(Id,DepartamentoId),
UNIQUE(DepartamentoId,Nombre));
GO

CREATE TABLE Colonias(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
CiudadId INTEGER NOT NULL REFERENCES Ciudades(Id),
Nombre VARCHAR(250) NOT NULL,
Activo BIT NOT NULL,
UNIQUE(Id,CiudadId),
UNIQUE(CiudadId,Nombre));
GO

CREATE TABLE Direcciones(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
PaisId INTEGER NOT NULL REFERENCES Paises(Id),
DepartamentoId INTEGER NOT NULL REFERENCES Departamentos(Id),
CiudadId INTEGER NOT NULL REFERENCES Ciudades(Id),
ColoniaId INTEGER NOT NULL REFERENCES Colonias(Id),
Referencia VARCHAR(250),
CONSTRAINT FK_DEPARTAMENTO_PAIS FOREIGN KEY(DepartamentoId,PaisId) REFERENCES Departamentos(Id,PaisId),
CONSTRAINT FK_CIUDAD_DEPARTAMENTO FOREIGN KEY(CiudadId,DepartamentoId) REFERENCES Ciudades(Id,DepartamentoId),
CONSTRAINT FK_COLONIA_CIUDAD FOREIGN KEY(ColoniaId,CiudadId) REFERENCES Colonias(Id,CiudadId));
GO

CREATE TABLE Personas(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
DNI VARCHAR(13) NOT NULL UNIQUE,
RTN VARCHAR(14) UNIQUE,
N1 VARCHAR(50) NOT NULL,
N2 VARCHAR(50),
AP1 VARCHAR(50) NOT NULL,
AP2 VARCHAR(50),
Sexo VARCHAR(1) NOT NULL,
FechaNacimiento DATE NOT NULL,
DireccionId INTEGER REFERENCES Direcciones(Id),
CHECK (Sexo = 'F' OR Sexo = 'M'));
GO

CREATE TABLE Telefonos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Num VARCHAR(8) NOT NULL UNIQUE,
PersonaId INTEGER REFERENCES Personas(Id),
Activo BIT NOT NULL);
GO

CREATE TABLE Correos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Email VARCHAR(254) NOT NULL UNIQUE,
PersonaId INTEGER REFERENCES Personas(Id),
Activo BIT NOT NULL,
UNIQUE(Id,PersonaId));
GO

CREATE TABLE Cargos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(250) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Horarios(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL UNIQUE,
HoraInicio TIME(0) NOT NULL,
HoraFinal TIME(0) NOT NULL,
CantidadDias INTEGER NOT NULL);
GO


CREATE TABLE DepartamentosHospital(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(250) NOT NULL UNIQUE,
Código VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Empleados(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
PersonaId INTEGER NOT NULL UNIQUE REFERENCES Personas(Id),
SalarioM DECIMAL(13,2) NOT NULL,
Activo BIT NOT NULL,
HorarioId INTEGER NOT NULL REFERENCES Horarios(Id),
DepartamentoId INTEGER NOT NULL REFERENCES DepartamentosHospital(Id),
CargoId INTEGER NOT NULL REFERENCES Cargos(Id),
FechaIngreso DATE NOT NULL,
UNIQUE(Id,PersonaId),
UNIQUE(PersonaId));
GO

CREATE TABLE Titulaciones(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(250) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE EmpleadoTitulacion(
EmpleadoId INTEGER NOT NULL REFERENCES Empleados(Id),
TitulacionId INTEGER NOT NULL REFERENCES Titulaciones(Id),
PRIMARY KEY (EmpleadoId,TitulacionId));
GO

CREATE TABLE DepartamentosEncargados(
EmpleadoEncargadoId INTEGER NOT NULL REFERENCES Empleados(Id),
DepartamentoId INTEGER NOT NULL REFERENCES DepartamentosHospital(Id),
PRIMARY KEY (EmpleadoEncargadoId,DepartamentoId));
GO

CREATE TABLE Medicos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
NumColegiado VARCHAR(6) NOT NULL UNIQUE,
EmpleadoId INTEGER NOT NULL UNIQUE REFERENCES Empleados(Id),
Disponible BIT NOT NULL);
GO

CREATE TABLE Pacientes(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
PersonaId INTEGER NOT NULL UNIQUE REFERENCES Personas(Id),
NumTelEmergencia VARCHAR(8) NOT NULL);
GO

CREATE TABLE TiposDeSangre(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE EstadosPaciente(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Expedientes(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
PacienteId INTEGER NOT NULL UNIQUE,
TipoSangreId INTEGER NOT NULL REFERENCES TiposDeSangre(Id),
EstadoId INTEGER NOT NULL REFERENCES EstadosPaciente(Id));
GO

CREATE TABLE Parentescos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Patologias(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
CodigoCIE VARCHAR(10) NOT NULL UNIQUE,
Nombre VARCHAR(250) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Medicamentos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(250) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE UnidadesDeMedida(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Dosificaciones(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
UnidadMedidaId INTEGER NOT NULL REFERENCES UnidadesDeMedida(Id),
Cantidad INTEGER NOT NULL,
FrecuenciaHoras INTEGER NOT NULL,
UNIQUE (Id,UnidadMedidaId));
GO

CREATE TABLE ExpedientesPatologiasBaseCronicas(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
ExpedienteId INTEGER NOT NULL REFERENCES Expedientes(Id),
PatologiaId INTEGER NOT NULL REFERENCES Patologias(Id),
UNIQUE (ExpedienteId, PatologiaId));
GO

CREATE TABLE ExpedientesAntecedentesFamiliaresPatologias(
ExpedienteId INTEGER NOT NULL REFERENCES Expedientes(Id),
PatologiaId INTEGER NOT NULL REFERENCES Patologias(Id),
ParentescoId INTEGER NOT NULL REFERENCES Parentescos(Id),
PRIMARY KEY (ExpedienteId,PatologiaId,ParentescoId));
GO

CREATE TABLE Especialidades(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(200) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE MedicosEspecialidades(
MedicoId INTEGER NOT NULL REFERENCES Medicos(Id),
EspecialidadId INTEGER NOT NULL REFERENCES Especialidades(Id),
PRIMARY KEY (MedicoId,EspecialidadId));
GO

CREATE TABLE PersonalAdministrativo(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
EmpleadoId INTEGER NOT NULL REFERENCES Empleados(Id));
GO

CREATE TABLE ConsultasMedicas(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Fecha DATE NOT NULL,
Hora TIME(0) NOT NULL,
MedicoId INTEGER NOT NULL REFERENCES Medicos(Id),
ExpedienteId INTEGER NOT NULL REFERENCES Expedientes(Id),
Costo DECIMAL(13,2) NOT NULL,
UNIQUE(Id,MedicoId),
UNIQUE(Id,ExpedienteId));
GO

CREATE TABLE CaracteristicasEx(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Examenes(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE ExamenesCaracteristicas(
ExamenId INTEGER REFERENCES Examenes(Id),
CaracteristicaId INTEGER REFERENCES CaracteristicasEx(Id),
PRIMARY KEY (ExamenId,CaracteristicaId));

CREATE TABLE OrdenesEx(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
ExpedienteId INTEGER NOT NULL REFERENCES Expedientes(Id),
MedicoId INTEGER NOT NULL REFERENCES Medicos(Id),
ConsultaId INTEGER NOT NULL REFERENCES ConsultasMedicas(Id),
Fecha DATE NOT NULL,
CONSTRAINT FK_CONSULTA_EXPEDIENTE FOREIGN KEY (ConsultaId,ExpedienteId) REFERENCES ConsultasMedicas(Id,ExpedienteId),
CONSTRAINT FK_CONSULTA_MEDICO FOREIGN KEY (ConsultaId,MedicoId) REFERENCES ConsultasMedicas(Id,MedicoId));
GO

CREATE TABLE ExamenesOrden(
OrdenId INTEGER REFERENCES OrdenesEx(Id),
ExamenId INTEGER REFERENCES Examenes(Id),
PRIMARY KEY (OrdenId,ExamenId));
GO

CREATE TABLE ResultadosExamenes(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
OrdenId INTEGER NOT NULL REFERENCES OrdenesEx(Id),
ExamenId INTEGER NOT NULL REFERENCES Examenes(Id),
CaracteristicaId INTEGER NOT NULL REFERENCES CaracteristicasEx(Id),
CONSTRAINT FK_EXAMEN_CARACTERISTICA FOREIGN KEY (ExamenId,CaracteristicaId) REFERENCES ExamenesCaracteristicas(ExamenId,CaracteristicaId),
CONSTRAINT FK_ORDEN_EXAMEN FOREIGN KEY (OrdenId,ExamenId) REFERENCES ExamenesOrden(OrdenId,ExamenId));

CREATE TABLE Diagnosticos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
ObservacionMedica NVARCHAR(MAX),
ExpedienteId INTEGER NOT NULL REFERENCES Expedientes(Id),
MedicoId INTEGER NOT NULL REFERENCES Medicos(Id),
Fecha DATE NOT NULL,
ConsultaId INTEGER NOT NULL REFERENCES ConsultasMedicas(Id),
UNIQUE(Id,ExpedienteId),
UNIQUE(Id,MedicoId),
UNIQUE(Id,ConsultaId),
CONSTRAINT FK_CONSULTA_MEDICO_2 FOREIGN KEY (ConsultaId,MedicoId) REFERENCES ConsultasMedicas(Id,MedicoId),
CONSTRAINT FK_CONSULTA_EXPEDIENTE_2 FOREIGN KEY (ConsultaId,ExpedienteId) REFERENCES ConsultasMedicas(Id,ExpedienteId));
GO

CREATE TABLE OrdenRecetas(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
MedicoId INTEGER NOT NULL REFERENCES Medicos(Id),
ExpedienteId INTEGER NOT NULL REFERENCES Expedientes(Id),
ConsultaId INTEGER NOT NULL REFERENCES ConsultasMedicas(Id),
DiagnosticoId INTEGER NOT NULL REFERENCES Diagnosticos(Id),
Atendida BIT NOT NULL,
UNIQUE(MedicoId,ExpedienteId,ConsultaId,DiagnosticoId),
CONSTRAINT FK_CONSULTA_MEDICO_3 FOREIGN KEY (ConsultaId,MedicoId) REFERENCES ConsultasMedicas(Id,MedicoId),
CONSTRAINT FK_CONSULTA_EXPEDIENTE_3 FOREIGN KEY (ConsultaId,ExpedienteId) REFERENCES ConsultasMedicas(Id,ExpedienteId),
CONSTRAINT FK_DIAGNOSTICO_EXPEDIENTE FOREIGN KEY (DiagnosticoId,ExpedienteId) REFERENCES Diagnosticos(Id,ExpedienteId),
CONSTRAINT FK_DIAGNOSTICO_MEDICO FOREIGN KEY (DiagnosticoId,MedicoId) REFERENCES Diagnosticos(Id,MedicoId),
CONSTRAINT FK_DIAGNOSTICO_CONSULTA FOREIGN KEY (DiagnosticoId,ConsultaId) REFERENCES Diagnosticos(Id,ConsultaId));
GO

CREATE TABLE DiagnosticosPatologias(
DiagnosticoId INTEGER NOT NULL REFERENCES Diagnosticos(Id),
PatologiaId INTEGER NOT NULL REFERENCES Patologias(Id),
PRIMARY KEY (DiagnosticoId,PatologiaId));
GO

CREATE TABLE CategoriasDePatologias(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(250) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE PatologiasCategorias(
PatologiaId INTEGER NOT NULL REFERENCES Patologias(Id),
CategoriaId INTEGER NOT NULL REFERENCES CategoriasDePatologias(Id),
PRIMARY KEY (PatologiaId,CategoriaId));
GO

CREATE TABLE TiposDeProductos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(250) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL,
UnidadMedidaId INTEGER NOT NULL REFERENCES UnidadesDeMedida(Id),
UNIQUE(Id,UnidadMedidaId));
GO

CREATE TABLE MarcasDeProductos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Productos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
MedicamentoId INTEGER NOT NULL REFERENCES Medicamentos(Id),
NombreComercial VARCHAR(100) NOT NULL,
TipoId INTEGER NOT NULL REFERENCES TiposDeProductos(Id),
MarcaId INTEGER NOT NULL REFERENCES MarcasDeProductos(Id),
UnidadMedidaId INTEGER NOT NULL REFERENCES UnidadesDeMedida(Id),
CantidadContenido DECIMAL(13,2) NOT NULL,
UNIQUE(Id,MedicamentoId,TipoId,MarcaId),
UNIQUE (Id,UnidadMedidaId),
CONSTRAINT FK_TIPOPRODUCTO_UNIDADMEDIDA FOREIGN KEY (TipoId,UnidadMedidaId) REFERENCES TiposDeProductos(Id,UnidadMedidaId));
GO

CREATE TABLE ExpPatologíasBaseMedicamentos(
ExpPatologiaBaseId INTEGER REFERENCES ExpedientesPatologiasBaseCronicas(Id),
ProductoId INTEGER REFERENCES Productos(Id),
DosificacionId INTEGER NOT NULL REFERENCES Dosificaciones(Id),
UnidadMedidaId INTEGER NOT NULL REFERENCES UnidadesDeMedida(Id),
CONSTRAINT FK_Producto_UnidadDeMedida FOREIGN KEY (ProductoId,UnidadMedidaId) REFERENCES Productos(Id,UnidadMedidaId),
CONSTRAINT FK_Dosificacion_UnidadMedida FOREIGN KEY (DosificacionId,UnidadMedidaId) REFERENCES Dosificaciones(Id,UnidadMedidaId),
PRIMARY KEY (ExpPatologiaBaseId, ProductoId));

CREATE TABLE OrdenRecetasProductos(
RecetaId INTEGER NOT NULL REFERENCES OrdenRecetas(Id),
ProductoId INTEGER NOT NULL REFERENCES Productos(Id),
Cantidad INTEGER NOT NULL,
DosificacionId INTEGER NOT NULL REFERENCES Dosificaciones(Id),
UnidadMedidaId INTEGER NOT NULL REFERENCES UnidadesDeMedida(Id),
DuracionDias INTEGER NOT NULL,
CantEntregados INTEGER NOT NULL,
PRIMARY KEY (RecetaId,ProductoId),
CONSTRAINT FK_Dosificacion_UnidadMedida_2 FOREIGN KEY (DosificacionId,UnidadMedidaId) REFERENCES Dosificaciones(Id,UnidadMedidaId),
CHECK (CantEntregados < Cantidad OR CantEntregados = Cantidad));
GO

CREATE TABLE LotesProductos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
ProductoId INTEGER NOT NULL REFERENCES Productos(Id),
FechaIngreso DATE NOT NULL,
FechaElab DATE NOT NULL,
FechaVencimiento DATE NOT NULL,
CantidadIngresada INTEGER NOT NULL,
CantidadActual INTEGER NOT NULL,
UNIQUE(Id,ProductoId));
GO

CREATE TABLE TipoDeMovimientos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL UNIQUE,
Factor INTEGER NOT NULL);
GO

CREATE TABLE FichaInventario(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Fecha DATE NOT NULL,
TipoMivimientoId INTEGER NOT NULL REFERENCES TipoDeMovimientos(Id),
ProductoId INTEGER NOT NULL REFERENCES Productos(Id),
Cantidad DECIMAL(13,2) NOT NULL,
LoteId INTEGER NOT NULL REFERENCES LotesProductos(Id),
CONSTRAINT FK_LOTE_PRODUCTO FOREIGN KEY (LoteId,ProductoId) REFERENCES LotesProductos(Id,ProductoId));
GO

CREATE TABLE RangosNumFactura(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
CAI VARCHAR(32) NOT NULL UNIQUE,
RangoInicio VARCHAR(8) NOT NULL UNIQUE,
RangoFin VARCHAR(8) NOT NULL UNIQUE,
FechaLimite DATE NOT NULL,
CHECK (DATEDIFF(MONTH,FechaLimite,GETDATE()) > 24));
GO

CREATE TABLE Facturas(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
NumFactura VARCHAR(16) NOT NULL UNIQUE,
RangoId INTEGER NOT NULL REFERENCES RangosNumFactura(Id),
PacienteId INTEGER NOT NULL REFERENCES Pacientes(Id),
EmpleadoId INTEGER NOT NULL REFERENCES Empleados(Id),
FechaEmision DATE NOT NULL,
HoraEmision TIME(0) NOT NULL,
Subtotal DECIMAL(13,2) NOT NULL,
ISV DECIMAL(13,2) NOT NULL,
TOTAL DECIMAL(13,2) NOT NULL,
ConsultaId INTEGER NOT NULL REFERENCES ConsultasMedicas(Id));
GO

CREATE TABLE FormasDePago(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(50) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE FacturasFormasDePago(
FacturaId INTEGER NOT NULL REFERENCES Facturas(Id),
FormaDePagoId INTEGER NOT NULL REFERENCES FormasDePago(Id),
Importe DECIMAL(13,2) NOT NULL,
PRIMARY KEY (FacturaId,FormaDePagoId));
GO

CREATE TABLE Permisos(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE Roles(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL UNIQUE,
Codigo VARCHAR(5) NOT NULL UNIQUE,
Activo BIT NOT NULL);
GO

CREATE TABLE PermisosRoles(
PermisoId INTEGER NOT NULL REFERENCES Permisos(Id),
RolId INTEGER NOT NULL REFERENCES Roles(Id),
PRIMARY KEY (PermisoId,RolId));
GO

CREATE TABLE Usuarios(
Id INTEGER IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(30) NOT NULL UNIQUE,
PersonaId INTEGER NOT NULL REFERENCES Personas(Id),
EmpleadoId INTEGER NOT NULL REFERENCES Empleados(Id),
CorreoId INTEGER NOT NULL REFERENCES Correos(Id),
Contrasena VARCHAR(64) NOT NULL,
Activo BIT NOT NULL,
CONSTRAINT FK_EMPLEADO_PERSONA FOREIGN KEY (EmpleadoId,PersonaId) REFERENCES Empleados(Id,PersonaId),
CONSTRAINT FK_CORREO_PERSONA FOREIGN KEY (CorreoId,PersonaId) REFERENCES Correos(Id,PersonaId));
GO

CREATE TABLE UsuariosRoles(
UsuarioId INTEGER NOT NULL REFERENCES Usuarios(Id),
RolId INTEGER NOT NULL REFERENCES Roles(Id),
PRIMARY KEY (UsuarioId,RolId));
GO