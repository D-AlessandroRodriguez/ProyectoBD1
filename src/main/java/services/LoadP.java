package services;

import enfermero_rh_DAO.LoadDAO;
import enfermero_rh_DAO.LoadDataDAO;
import jakarta.servlet.http.HttpServletRequest;

/**
 * Obtiene los paises para guardados en la base
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/08/15
 * @since 2024/08/15
 */
public class LoadP {

	private LoadDAO paises = new LoadDAO();
	private LoadDataDAO data = new LoadDataDAO();

	/**
	 * Se encarga de filtrar las consultas  que se van a hacer para recargar datos de acuerdo a un nombre
	 *  @param request contiene los parametros de la peticion
	 */
	public String load(HttpServletRequest request) {

		String nombre = request.getParameter("nombre");
		String codigo = null;

		

		if (nombre.equals("CargaPais")) {
			codigo = null;
		} else if(nombre.equals("Titulaciones")){
			codigo = null;
		}else if(nombre.equals("doctor")){
			System.out.println(nombre);
			codigo = null;
		}
		else {
			codigo = request.getParameter("codigo");
		}

		
		return this.paises.loadPaises(nombre, codigo);

	}

	/**
	 * Se encarga de filtrar las consultas para el tipo de sangre y estado de un paciente
	 *  @param request contiene los parametros de la peticion
	 */
	public String loadTypeBlood(HttpServletRequest request) {

		
		String typeBlood = request.getParameter("TiposDeSangre");
		
		String statusPersona = request.getParameter("EstadosPaciente");
		String value = new String();
		if(typeBlood != null) {
			value = typeBlood;
		}else if(statusPersona != null) {
			value = statusPersona;
		}
		
		return this.data.getBloodType(value);
	}

}
