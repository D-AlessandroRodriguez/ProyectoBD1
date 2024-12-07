package enfermero_rh_api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.LoadP;

import java.io.IOException;

/**
 * Recibe la peticiones para sacar datos de la base
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/27
 * @since 2024/11/27
 */
@WebServlet(description = "Carga datos", urlPatterns = { "/api/load" })
public class Load extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("application/json");
		LoadP load = new LoadP();

		response.getWriter().append(load.loadTypeBlood(request));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
