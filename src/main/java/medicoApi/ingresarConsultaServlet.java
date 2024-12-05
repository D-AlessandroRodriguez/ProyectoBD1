package medicoApi;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import medicoDAO.RegistrarConsultaDAO;

/**
 * Servlet implementation class ingresarConsultaServlet
 */
@WebServlet("/api/ingresarConsulta")
public class ingresarConsultaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ingresarConsultaServlet() {
        super();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pacienteNombre = request.getParameter("paciente");
		String fecha= request.getParameter("fecha");
		String hora = request.getParameter("hora");
		String costo = request.getParameter("costo");
		
		HttpSession session = request.getSession();
		String idMedico = (String) session.getAttribute("idMedico");
		
		try {
			RegistrarConsultaDAO rc = new RegistrarConsultaDAO();
			rc.registrarConsulta(pacienteNombre, fecha, hora, costo, idMedico);
			response.getWriter().append("{\"status\": true, \"filasAfectadas\":\"%s\"}");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.getWriter().append("{\"status\": true}");
	}

}
