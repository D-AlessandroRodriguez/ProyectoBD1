package api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import DAO.RecipeProductsDAO;

/**
 * Servlet que accede a la base de datos para obtener los productos que están relacionados a una receta determinada.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/11/27
 * @date 2024/11/27
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/api/get_recipe_products" })
public class GetRecipeProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRecipeProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * Método que recibe una petición por POST a través de la cual se recibe el id de la receta de la que se quiere obtener sus productos.
	 * @author jesus.zeped@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/27
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		int recipeId = 0;
		
		try {
			
			String recipeIdString = request.getParameter("id");
			
			if (recipeIdString != null) {
				
				recipeId = Integer.parseInt(recipeIdString);
				
				String recipeProducts = RecipeProductsDAO.getRecipeProducts(recipeId);
				
				response.getWriter().append(recipeProducts);
			}
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			//e.printStackTrace();
		}
	}
}
