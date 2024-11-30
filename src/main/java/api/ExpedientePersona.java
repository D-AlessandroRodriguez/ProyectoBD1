package api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import programLibraries.ProcessData;

import java.io.IOException;
/**
 * Servlet para agregar nuevas personas
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/27
 * @since 2024/11/27
 * */
@WebServlet(description = "Creacion de nuevos expedientes", urlPatterns = { "/api/expedientePersona" })
public class ExpedientePersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ExpedientePersona() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 *Recibe la peticion con los datos para crear una nueva persona
	 * @author agblandin@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/27
	 * @since 2024/11/27
	 * */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("application/json");
		
		ProcessData data = new ProcessData();
		data.craetePerson(request);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
