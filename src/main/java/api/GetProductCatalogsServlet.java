package api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import com.google.gson.Gson;

import DAO.ProductCatalogsDAO;

/**
 * Servlet implementation class GetProductCatalogsServlet
 */
@WebServlet(asyncSupported = true, description = "Recibe las peticiones del frontend para devolver de la base de datos a los catálogos necesarios para poder registrar un producto.", urlPatterns = { "/api/get_product_catalogs" })
public class GetProductCatalogsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductCatalogsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		
		String operation = request.getParameter("op");
		
		if (operation.equals("1")) {
			
			try {
				
				Map<String,Object> responseMap = ProductCatalogsDAO.getProductBranchesAndTypes();
				response.getWriter().append(new Gson().toJson(responseMap));
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				
				response.getWriter().append("{branches: [], types: []}");
			}
		
		} else if (operation.equals("2")) {
			
			String typeCode = request.getParameter("typeCode");
			
			if (typeCode != null) {
				
				try {
					
					Map<String,Object> responseMap = ProductCatalogsDAO.getMeasurementUnit(typeCode);
					response.getWriter().append(new Gson().toJson(responseMap));
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					
					response.getWriter().append("{measurementUnit: {name: '', code: ''}}");
				}
			}
		
		} else if (operation.equals("3")) {
			
			try {
				
				Map<String,Object> responseMap = ProductCatalogsDAO.getProductCategories();
				response.getWriter().append(new Gson().toJson(responseMap));
			
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				
				response.getWriter().append("{productCategories: []}");
			}
		}
	}

}
