package api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import DAO.ProductBatchesDAO;

/**
 * Servlet implementation class RegisterProductBatch
 */
@WebServlet(asyncSupported = true, description = "Recibe la petición del cliente Frontend para registrar un lote de un producto.", urlPatterns = { "/api/register_batch" })
public class RegisterProductBatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterProductBatch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		try {
			
			String productId = request.getParameter("productId");
			String productionDate = request.getParameter("productionDate");
			String expirationDate = request.getParameter("expirationDate");
			int batchQuantity = Integer.parseInt(request.getParameter("batchQuantity"));
			
			Map<String,Object> responseMap = new HashMap<>();
			
			Map<String,String> responseContent = ProductBatchesDAO.registerBatch(productId,productionDate,expirationDate,batchQuantity);
			
			if (responseContent != null) {
				responseMap.put("status", true);
				responseMap.put("content", responseContent);
				responseMap.put("errorMessage", "");
			} else {
				responseMap.put("status", false);
				responseMap.put("content", "");
				responseMap.put("errorMessage", "No se pudo registrar el lote del producto!");
			}
			
			response.getWriter().append(new Gson().toJson(responseMap));
		
		} catch (NumberFormatException e) {
			//e.printStackTrace();
		}
	}
}