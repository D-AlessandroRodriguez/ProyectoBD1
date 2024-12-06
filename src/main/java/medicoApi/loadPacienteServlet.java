package medicoApi;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import medicoDAO.GetPacientesDAO;

/**
 * Servlet implementation class loadPacienteServlet
 */
@WebServlet("/api/loadPaciente")
public class loadPacienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public loadPacienteServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
/**
 * recibimos la peticion POST para hacer una peticion a la base de datos
 * en donde sacamos todo la data de nombre de los pacientes y tambien el idPaciente 
 * segun el idDoctor guardado en session
 * @author Aless
 * @version 0.0.1
 * @date 2024/12/4
 * @since 2024/12/4 
 * */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		HttpSession session = request.getSession(false);
		String nombreMedico = (String) session.getAttribute("nombreMedico");
		
		try {
			response.getWriter().append(String.format("{\"paciente\": %s, \"nombreMedico\": \"%s\"}",
					new GetPacientesDAO().getPacientes(),
					nombreMedico
					));
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}

}
