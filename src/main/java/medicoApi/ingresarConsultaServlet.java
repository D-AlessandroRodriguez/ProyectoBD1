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
 * servlet donde se recibe los parametros para hacer un INSERT INTO consultaMedica
 *	@author cdcruzr@unah.hn
 * @version 0.2.0
 * @since 2024/12/4
 * @date 2024/12/6
 */
@WebServlet("/api/ingresarConsulta")
public class ingresarConsultaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ingresarConsultaServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/*
	 * peticion post donde recibimos todos los parametros
	 * @author cdcruzr@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/4
	 * @date 2024/12/6
	 **/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pacienteNombre = request.getParameter("paciente");
		String fecha= request.getParameter("fecha");
		String hora = request.getParameter("hora");
		String costo = request.getParameter("costo");
		
		
		HttpSession session = request.getSession(false);
		int idMedico = (int) session.getAttribute("medicoId");
		
		try {
			RegistrarConsultaDAO rc = new RegistrarConsultaDAO();
			response.getWriter().append(String.format("{\"status\": true, \"filasAfectadas\":\"%s\"}", 
					rc.registrarConsulta(pacienteNombre, fecha, hora, costo, idMedico)));
		} catch (ClassNotFoundException | SQLException  e) {
			e.printStackTrace();
			response.getWriter().append("{\"status\": false, \"message\": \"Error al hacer insert verificar los parametros o error de sentencias SQL\"}");
		}
	}

}
