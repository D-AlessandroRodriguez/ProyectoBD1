package services;

import java.math.BigDecimal;

/**
 * Crea un nuevo emleado con sus datos
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/28
 * @since 2024/11/28
 */
public class EmpleadoData {
	
	private Persona persona;
	private BigDecimal salario;
	private int activo;
	private int deptoId;
	private int cargoId;
	private String fechaI;
	private int id ;
	
	public EmpleadoData(Persona persona, BigDecimal salario, int activo, int deptoId, int cargoId, String fecgaI) {
		super();
		this.persona = persona;
		this.salario = salario;
		this.activo = activo;
		this.deptoId = deptoId;
		this.cargoId = cargoId;
		this.fechaI = fecgaI;
	}
	/**
	 * retorna el id del empleado
	 *  @return el el id del empleado 
	 */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	/**
	 *  @return retorna el id de la persona 
	 */
	public Persona getPersona() {
		return persona;
	}
	/**
	 *  @return retorna salario de el empleado
	 */
	public BigDecimal getSalario() {
		return salario;
	}
	/**
	 *  @return retorna si la persona sigue activa 
	 */
	public int getActivo() {
		return activo;
	}
	/**
	 *  @return retorna el id del departamento asociado al empleado 
	 */
	public int getDeptoId() {
		return deptoId;
	}
	/**
	 *  @return retorna el id del cargo asociado al empleado 
	 */
	public int getCargoId() {
		return cargoId;
	}
	/**
	 *  @return retorna la fecha de inicio de trabajo asociado al empleado 
	 */
	public String getFechaI() {
		return fechaI;
	}

}
