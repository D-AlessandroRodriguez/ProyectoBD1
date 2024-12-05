package medicoApi;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import medicoDAO.ConsultasSelectDAO;

/**
 * Servlet implementation class getConsultasServlet
 */
@WebServlet("/api/getConsultas")
public class getConsultasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public getConsultasServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");

		int draw = 0, start = 0, length = 0, orderColumnIndex = 0;
		try {

			draw = Integer.parseInt(request.getParameter("draw"));
			start = Integer.parseInt(request.getParameter("start"));
			length = Integer.parseInt(request.getParameter("length"));
			orderColumnIndex = Integer.parseInt(request.getParameter("order[0][column]"));

		} catch (NumberFormatException e) {

			// e.printStackTrace();
		}

		String searchValue = request.getParameter("search[value]");
		String orderDirection = request.getParameter("order[0][dir]");

		try {

			Map<String, Object> dataTableResponse = ConsultasSelectDAO.getConsultas(start, length, searchValue,
					orderColumnIndex, orderDirection);

			dataTableResponse.put("draw", String.format("%s", draw));

			response.getWriter().append(new Gson().toJson(dataTableResponse));

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}		
	}
}
