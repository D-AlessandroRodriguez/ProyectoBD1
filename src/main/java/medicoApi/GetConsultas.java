package medicoApi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import medicoDAO.ConsultasSelectDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import com.google.gson.Gson;

/**
 * Servlet implementation class GetConsultas
 */
@WebServlet("/api/GetConsultas")
public class GetConsultas extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetConsultas() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");

		try {

			Map<String, Object> dataTableResponse = ConsultasSelectDAO.getConsultas();
			response.getWriter().append(new Gson().toJson(dataTableResponse));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}		
	}
}
