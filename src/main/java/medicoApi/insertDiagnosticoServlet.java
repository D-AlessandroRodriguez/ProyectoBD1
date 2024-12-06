package medicoApi;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import medicoDAO.RegistrarDiagnosticoDAO;

/**
 * Servlet implementation class insertDiagnosticoServlet
 */
@WebServlet("/api/insertDiagnosticoServlet")
public class insertDiagnosticoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public insertDiagnosticoServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");

		String nombrePaciente = request.getParameter("nombrePaciente");
		String observacion = request.getParameter("observaciones");
		String fecha = request.getParameter("fecha");

		HttpSession session = request.getSession(false);
		int idMedico = (int) session.getAttribute("medicoId");

		RegistrarDiagnosticoDAO rd = new RegistrarDiagnosticoDAO();
		try {
			rd.registrarDiagnostico(nombrePaciente, observacion, fecha, idMedico);
			response.getWriter().append("{\"status\": true, \"filasAfectadas\":\"%s\"}");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
