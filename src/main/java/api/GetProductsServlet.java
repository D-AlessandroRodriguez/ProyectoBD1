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

import DAO.ProductsDAO;

/**
 * Servlet que accede a la base de datos para obtener los productos según los parámetros enviados del cliente Frontend.
 * @author jesus.zepeda@unah.hn
 * @version 0.2.0
 * @since 2024/11/25
 * @date 2024/11/26
 */
@WebServlet(asyncSupported = true, description = "Obtiene los productos de la base de datos según los pida el cliente Frontend", urlPatterns = { "/api/get_products" })
public class GetProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * Método que recibe la petición POST del cliente Frontend para mostrar la información de los productos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/11/25
	 * @date 2024/11/26
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		int draw = Integer.parseInt(request.getParameter("draw"));
		int start = Integer.parseInt(request.getParameter("start"));
		int length = Integer.parseInt(request.getParameter("length"));
		String searchValue = request.getParameter("search[value]");
		String orderColumnName = request.getParameter("order[0][name]");
		String orderDirection = request.getParameter("order[0][dir]");
		
		try {
			
			Map<String,Object> dataTableResponse = ProductsDAO.getProducts(start, length, searchValue, orderColumnName, orderDirection);
			
			dataTableResponse.put("draw", String.format("%s", draw));
			
			System.out.println(new Gson().toJson(dataTableResponse));
			
			response.getWriter().append(new Gson().toJson(dataTableResponse));
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
