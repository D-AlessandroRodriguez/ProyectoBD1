package services;

/**
 * Representa una persona con información personal como nombres, apellidos, fecha de nacimiento, y otros datos.
 * @version 0.1.0
 * @date 2024/11/28
 * @since 2024/11/28
 */
public class Persona {
	
	private String dni;
	private String rtn = null;
	private String nombre1;
	private String nombre2 = new String();
	private String apellido1;
	private String apellido2 = new String();
	private String fechaNacimiento;
	private String sexoPersona;
	private int id;

	/**
	 * Constructor que inicializa los atributos principales de una persona.
	 * @param dni el Documento Nacional de Identidad de la persona
	 * @param rtn el Registro Tributario Nacional de la persona
	 * @param nombre1 el primer nombre de la persona
	 * @param nombre2 el segundo nombre de la persona (opcional)
	 * @param apellido1 el primer apellido de la persona
	 * @param apellido2 el segundo apellido de la persona (opcional)
	 * @param fechaNacimiento la fecha de nacimiento de la persona en formato AAAA-MM-DD
	 * @param sexoPersona el sexo de la persona (M/F)
	 */
	public Persona(String dni, String rtn, String nombre1, String nombre2, String apellido1, String apellido2,
			String fechaNacimiento, String sexoPersona) {
		
		this.dni = dni;
		this.rtn = rtn;
		this.nombre1 = nombre1;
		this.nombre2 = nombre2;
		this.apellido1 = apellido1;
		this.apellido2 = apellido2;
		this.fechaNacimiento = fechaNacimiento;
		this.sexoPersona = sexoPersona;
	}

	/**
	 * Retorna el DNI de la persona.
	 * @return el Documento Nacional de Identidad de la persona
	 */
	public String getDni() {
		return dni;
	}

	/**
	 * Retorna el RTN de la persona.
	 * @return el Registro Tributario Nacional de la persona
	 */
	public String getRtn() {
		return rtn;
	}

	/**
	 * Retorna el primer nombre de la persona.
	 * @return el primer nombre de la persona
	 */
	public String getNombre1() {
		return nombre1;
	}

	/**
	 * Retorna el segundo nombre de la persona.
	 * @return el segundo nombre de la persona
	 */
	public String getNombre2() {
		return nombre2;
	}

	/**
	 * Retorna el primer apellido de la persona.
	 * @return el primer apellido de la persona
	 */
	public String getApellido1() {
		return apellido1;
	}

	/**
	 * Retorna el segundo apellido de la persona.
	 * @return el segundo apellido de la persona
	 */
	public String getApellido2() {
		return apellido2;
	}

	/**
	 * Retorna la fecha de nacimiento de la persona.
	 * @return la fecha de nacimiento de la persona en formato AAAA-MM-DD
	 */
	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	/**
	 * Retorna el sexo de la persona.
	 * @return el sexo de la persona (M/F) sin espacios en blanco
	 */
	public String getSexoPersona() {
		return sexoPersona.trim();
	}

	/**
	 * Retorna el identificador único de la persona.
	 * @return el identificador único de la persona
	 */
	public int getId() {
		return id;
	}

	/**
	 * Actualiza el identificador único de la persona.
	 * @param id el nuevo valor del identificador único de la persona
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Actualiza el RTN de la persona.
	 * @param value el nuevo valor del RTN de la persona
	 */
	public void setRtn(String value) {
		this.rtn = value;
	}
}
