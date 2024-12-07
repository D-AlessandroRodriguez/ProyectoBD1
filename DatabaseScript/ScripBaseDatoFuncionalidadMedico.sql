
---------------------------------------------------------------------------------------
-- QUERY PARA obtener todos los nombres del paciente
SELECT per.Id, per.N1, per.AP1 FROM Pacientes pac INNER JOIN Personas per ON pac.PersonaId = per.Id;
---------------------------------------------------------------------------------------
-- query encontrar el expediente del paciente con dicho nombre

CREATE PROCEDURE BuscarExpedienteConsulta
    @idPaciente INT
AS
BEGIN
    SELECT expe.Id AS 'Id expediente', consul.Id AS 'id Consulta'
    FROM Pacientes pac
    INNER JOIN Expedientes expe ON expe.PacienteId = pac.Id
    INNER JOIN Personas pers ON pac.PersonaId = pers.Id
	INNER JOIN ConsultasMedicas consul ON expe.Id = consul.ExpedienteId
    WHERE expe.PacienteId = @idPaciente;
END;

EXEC BuscarExpedienteConsulta @idPaciente = 1;

---------------------------------------------------------------------------------------
--QUERY ingresar consultasMedicas
CREATE PROCEDURE insertConsutasMedicas
	@Fecha DATE,
    @Hora TIME,
    @MedicoId INT,
    @ExpedienteId INT,
    @Costo DECIMAL(10, 2)
AS
BEGIN
	BEGIN TRANSACTION;
		BEGIN TRY
			INSERT INTO ConsultasMedicas (Fecha, Hora, MedicoId, ExpedienteId, Costo)
			VALUES (@Fecha, @Hora, @MedicoId, @ExpedienteId, @Costo);
		COMMIT;
		END TRY
		BEGIN CATCH
		ROlLBACK;
		DECLARE @errorMessage VARCHAR(1000) = ERROR_MESSAGE();
		THROW 50000, @errorMessage, 1;
		END CATCH;
END;
EXEC insertConsutasMedicas @Fecha = '2024-12-05', @Hora = '10:30:00', @MedicoId = 1, @ExpedienteId = 1002, @Costo = 250.00;
-----------------------------------------------------------------------------------------------
-- QUERY ingresar diagnostico
CREATE PROCEDURE insertDiagnostico
	@observaciones VARCHAR(255),
	@Fecha DATE,
    @MedicoId INT,
    @ExpedienteId INT,
    @consultaId INT
AS
BEGIN
	BEGIN TRANSACTION;
		BEGIN TRY
			INSERT INTO Diagnosticos VALUES (@observaciones, @ExpedienteId, @MedicoId, @Fecha, @consultaId);
		COMMIT;
		END TRY
		BEGIN CATCH
		ROlLBACK;
		DECLARE @errorMessage VARCHAR(1000) = ERROR_MESSAGE();
		THROW 50000, @errorMessage, 1;
		END CATCH;
END;

EXEC insertDiagnostico @observaciones = 'esta grave', @ExpedienteId = 1, @MedicoId = 1, @Fecha = '2024-12-11', @consultaId = 1;
-----------------------------------------------------------------------------------------------

-- QUERY PARA TRAER TODAS LAS CONSULTAS
CREATE PROCEDURE selectConsultas
	-- sin parametros
AS
BEGIN
SELECT con.Id, pers.N1, pers.AP1, con.Fecha
FROM ConsultasMedicas con
INNER JOIN Expedientes expe
ON con.ExpedienteId = expe.Id
INNER JOIN Pacientes pac
ON expe.PacienteId = pac.Id
INNER JOIN Personas pers
ON pac.PersonaId = pers.Id
END;

EXEC selectConsultas;

SELECT * FROM OrdenRecetasProductos;
---------------------------------------------------------------------------------------
--QUERY ingresar consultasMedicas
CREATE PROCEDURE insertOrdenRecetasProductos
    @RecetaId INT,
    @ProductoId VARCHAR(19),
    @CantProductos INT,
    @CantDosis DECIMAL(5, 2),
    @UnidadMedidaId INT,
    @FrecuenciaHoras INT,
    @DuracionDias INT,
    @CantEntregados INT
AS
BEGIN
	BEGIN TRANSACTION;
		BEGIN TRY
			INSERT INTO OrdenRecetasProductos VALUES(
            @RecetaId, @ProductoId, @CantProductos, @CantDosis, @UnidadMedidaId,
            @FrecuenciaHoras, @DuracionDias, @CantEntregados
        );
		COMMIT;
		END TRY
		BEGIN CATCH
		ROlLBACK;
		DECLARE @errorMessage VARCHAR(1000) = ERROR_MESSAGE();
		THROW 50000, @errorMessage, 1;
		END CATCH;
END;

EXEC insertOrdenRecetasProductos @RecetaId = 1, @ProductoId = 'P-12345678901234567', @CantProductos = 10, @CantDosis = 2.5, @UnidadMedidaId = 1, @FrecuenciaHoras = 8, @DuracionDias = 5, @CantEntregados = 0;


--------------------------------------
-------------------------------------------------
DROP PROCEDURE selectUsuario;

--query para seleccionar el usario
CREATE PROCEDURE selectUsuario
	@correo VARCHAR(255),
	@contra VARCHAR(255)
AS
BEGIN
SELECT 
        u.Nombre AS NombreUsuario,
        r.Nombre AS NombreRol,
        u.Correo AS CorreoUsuario,
        e.Id AS EmpleadoId,
        CONCAT(p.N1, ' ', p.N2, ' ', p.AP1, ' ', p.AP2) AS NombreEmpleado,
        c.Nombre AS NombreCargo
    FROM 
        Usuarios u
    INNER JOIN 
        Empleados e ON u.EmpleadoId = e.Id
    INNER JOIN 
        Personas p ON e.PersonaId = p.Id
    LEFT JOIN 
        Cargos c ON e.CargoId = c.Id
    LEFT JOIN 
        UsuariosRoles ur ON u.Id = ur.UsuarioId
    LEFT JOIN 
        Roles r ON ur.RolId = r.Id
    WHERE 
    u.Correo = @correo 
    AND u.Contrasena = @contra;
END;

EXEC selectUsuario @correo = 'cesar@hospital.com', @contra = '1234';

------------------------------------------------------------------------------
SELECT 
    u.Nombre AS NombreUsuario,
    r.Nombre AS NombreRol,
    u.Correo AS CorreoUsuario,
    e.Id AS EmpleadoId,
    CONCAT(p.N1, ' ', p.N2, ' ', p.AP1, ' ', p.AP2) AS NombreEmpleado,
    c.Nombre AS NombreCargo
FROM 
    Usuarios u
INNER JOIN 
    Empleados e ON u.EmpleadoId = e.Id
INNER JOIN 
    Personas p ON e.PersonaId = p.Id
LEFT JOIN 
    Cargos c ON e.CargoId = c.Id
LEFT JOIN 
    UsuariosRoles ur ON u.Id = ur.UsuarioId
LEFT JOIN 
    Roles r ON ur.RolId = r.Id
WHERE 
    u.Correo = 'cesar@hospital.com' 
    AND u.Contrasena = 1234;
