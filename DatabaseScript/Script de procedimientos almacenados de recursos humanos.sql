--proceso registra personas
CREATE PROCEDURE InsertarPersona
    @DNI VARCHAR(13),
    @N1 VARCHAR(50),
    @N2 VARCHAR(50) = NULL,
    @AP1 VARCHAR(50),
    @AP2 VARCHAR(50) = NULL,
    @Sexo CHAR(1),
    @FechaNacimiento DATE,
    @DireccionId INT,
    @PersonaId INT OUTPUT
AS
BEGIN
    --
    INSERT INTO Personas (DNI,N1, N2, AP1, AP2, Sexo, FechaNacimiento, DireccionId)
    VALUES (@DNI,  @N1, @N2, @AP1, @AP2, @Sexo, @FechaNacimiento, @DireccionId);

    
    SET @PersonaId = SCOPE_IDENTITY();
END
GO

-- Proceso almacenado que inserta direcciones
CREATE PROCEDURE Insert_Direcciones
   @PaisId INTEGER ,
   @DeptoId INTEGER,
   @CiudadId INTEGER,
   @ColoniaId INTEGER,
   @referencia VARCHAR(250),
   @DireccionId INTEGER OUTPUT
AS 
BEGIN 
   INSERT INTO Direcciones VALUES(@PaisId,@DeptoId,@CiudadId,@ColoniaId,@referencia);

   SET @DireccionId = SCOPE_IDENTITY();

END
GO