package enfermero_rh_api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.ProcessDataEmpleado;

import java.io.IOException;

/**
 * Recibe la petición con los datos para crear un nuevo empleado
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/12/01
 * @since 2024/12/01
 */
@WebServlet("/api/empleado")
public class Empleado extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");

		ProcessDataEmpleado data = new ProcessDataEmpleado();
		String responseCreate = data.createEmpleado(request);

		response.getWriter().append(responseCreate);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
