package enfermero_rh_api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.ProcessDataExpediente;

import java.io.IOException;

/**
 * Servlet para agregar nuevas personas
 * 
 * @author
 * @version 0.1.0
 * @date 2024/12/06
 * @since 2024/12/06
 */
@WebServlet(description = "Creación de nuevos expedientes", urlPatterns = { "/api/expedientePersona" })
public class ExpedientePersona extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExpedientePersona() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		ProcessDataExpediente data = new ProcessDataExpediente();
		String responseCreate = data.craetePerson(request);

		response.getWriter().write(responseCreate);
	}
}
