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

import DAO.ProductsMovementsDAO;

/**
 * Servlet que accede a la base de datos para obtener el historial de movimiento de productos según los parámetros enviados del cliente Frontend.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/11/29
 * @date 2024/11/29
 */
@WebServlet(asyncSupported = true, description = "Obtiene el historial de movimientos de productos de la base de datos.", urlPatterns = { "/api/get_products_movements" })
public class GetProductsMovementsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductsMovementsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * Método que recibe la petición POST del cliente Frontend para mostrar el historial de movimientos de productos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/29
	 * @date 2024/11/29
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json");
		
		int draw = 0,start = 0,length = 0,orderColumnIndex = 0;
		try {
			
			draw = Integer.parseInt(request.getParameter("draw"));
			start = Integer.parseInt(request.getParameter("start"));
			length = Integer.parseInt(request.getParameter("length"));
			orderColumnIndex = Integer.parseInt(request.getParameter("order[0][column]"));
		
		} catch (NumberFormatException e) {
			//e.printStackTrace();
		}
		
		String searchValue = request.getParameter("search[value]");
		String orderDirection = request.getParameter("order[0][dir]");
		
		try {
			
			Map<String,Object> dataTableResponse = ProductsMovementsDAO.getProductsMovements(start, length, searchValue, orderColumnIndex, orderDirection);
			
			dataTableResponse.put("draw", String.format("%s", draw));
			
			response.getWriter().append(new Gson().toJson(dataTableResponse));
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
