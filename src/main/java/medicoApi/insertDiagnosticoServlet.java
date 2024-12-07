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
 * este servlet permite extraer los parametros cuando se envia desde el backend
 * @author cdcruzr@unah.hn
 * @version 0.1.0
 * @date 2024/12/5
 * @since 2024/12/6 
 * */
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
		
		String idPaciente = request.getParameter("idPaciente");
		String nombrePaciente = request.getParameter("paciente");
		String observacion = request.getParameter("observaciones");
		String fecha = request.getParameter("fecha");

		HttpSession session = request.getSession(false);
		int idMedico = (int) session.getAttribute("medicoId");

		try {
			RegistrarDiagnosticoDAO rd = new RegistrarDiagnosticoDAO();
			response.getWriter().append(String.format("{\"status\": true, \"filasAfectadas\":\"%s\"}",
										rd.registrarDiagnostico(idPaciente, nombrePaciente, observacion, fecha, idMedico)));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			response.getWriter().append("{\"status\": false, \"message\": \"Error al hacer insert verificar los parametros o error de sentencias SQL\"}");
		}
	}
}
