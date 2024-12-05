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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		HttpSession session = request.getSession();
		String nombreDoctor = (String) session.getAttribute("nombreDoctor");
		
		try {
			response.getWriter().append(String.format("{\"pacientes\": %s, \"nombreDoctor\": \"%s\"}",
					new GetPacientesDAO().getPacientes(),
					nombreDoctor));
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}

}
