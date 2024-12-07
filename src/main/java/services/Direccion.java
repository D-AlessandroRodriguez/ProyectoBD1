package services;


/**
 * Representa una direccion de una persona
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/28
 * @since 2024/11/28
 */
public class Direccion {
	
	private Integer pais;
	private Integer depto;
	private Integer ciudad;
	private Integer colonia;
	private String referencia;
	private Integer Id  = 0;
	
	public Direccion(Integer pais, Integer depto, Integer ciudad, Integer colonia, String referencia) {
	
		this.pais = pais;
		this.depto = depto;
		this.ciudad = ciudad;
		this.colonia = colonia;
		this.referencia = referencia;
	}
	/**
	 * retorna el pais asociado ala dirección 
	 *  @return retorna el id del pais asociado ala dirección 
	 */
	public Integer getPais() {
		return pais;
	}
	/**
	 * retorna el departamento asociado ala dirección 
	 *  @return retorna el id del departamento asociado ala dirección 
	 */
	public Integer getDepto() {
		return depto;
	}
	/**
	 * retorna el ciudad asociado ala dirección 
	 *  @return retorna el id de la  ciudad asociado ala dirección 
	 */
	public Integer getCiudad() {
		return ciudad;
	}
	/**
	 * retorna el colonia asociado ala dirección 
	 *  @return retorna el id de la colonia asociado ala dirección 
	 */
	public Integer getColonia() {
		return colonia;
	}
	/**
	 * retorna la referencia asociado ala dirección 
	 *  @return retorna el id de la referencia asociada ala dirección 
	 */
	public String getReferencia() {
		return referencia;
	}
	/**
	 * retorna la dirección 
	 *  @return retorna el id de la  dirección 
	 */
	public Integer getId() {
		return Id;
	}
	/**
	 * actualiza el id de la  dirección
	 *  @param id el nuevo valor del  el id de la  dirección 
	 */
	public void setId(int id) {
	 this.Id = id;
	}
	

}
