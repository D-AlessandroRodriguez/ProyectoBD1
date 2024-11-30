package programLibraries;

import DAO.PersonaDAO;
import jakarta.servlet.http.HttpServletRequest;

/**
 * ´Procesa los datos que se envian para guardar nuevos registros
 * @author cdcruzr@unah.hn
 * @version 0.1.0
 * @date 2024/08/15
 * @since 2024/08/15
 * */
public class ProcessData {

	private  PersonaDAO createPerson = new PersonaDAO() ;
	private Persona persona ;
	
	
	/**
	 * Obtiene los datos para guaradr una nueva persona
	 * @author agblandin@unah.hn
	 * @version 0.1.0
	 * @date 2024/08/15
	 * @since 2024/08/15
	 * */
	public void craetePerson(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		String nombre1 = request.getParameter("Nombre1");
		String nombre2 = request.getParameter("Nombre2");
		String apellido1 = request.getParameter("Apellido1");
		String apellido2 = request.getParameter("Apellido2");
		String  dni = request.getParameter("DNIPersona");
		String rtn = request.getParameter("RTNPersona");
		String sexoPersona = request.getParameter("sexoPersona");
		String fechaNacimiento = request.getParameter("fechaNacimiento");
		
		 this.persona = new Persona(dni,rtn,nombre1,nombre2,apellido1,apellido2,fechaNacimiento,sexoPersona);
		createPerson.create(persona);
		
		
	}

}
