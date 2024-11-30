package api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import DAO.AvailableProductsDAO;

/**
 * Servlet que accede a la base de datos para obtener los productos disponibles y no disponibles para entregar de una receta determinada.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/11/28
 * @date 2024/11/28
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/api/get_available_products" })
public class GetAvailableProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAvailableProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * Método que recibe la petición POST del cliente Frontend para obtener la disponibilidad de productos de una receta determinada.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/28
	 * @date 2024/11/28
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		int recipeId = 0;
		
		try {
			
			String recipeIdString = request.getParameter("id");
			
			if (recipeIdString != null) {
				
				recipeId = Integer.parseInt(recipeIdString);
				
				String availableProducts = AvailableProductsDAO.getAvailableProducts(recipeId);
				
				response.getWriter().append(availableProducts);
			}
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			//e.printStackTrace();
		}
	}
}
