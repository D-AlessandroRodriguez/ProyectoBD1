package api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

import DAO.ProductsDAO;

/**
 * Servlet implementation class RegisterProductServlet
 */
@WebServlet(asyncSupported = true, description = "Recibe los parámetros que corresponden a la información de un producto a ser registrado en la base de datos", urlPatterns = { "/api/register_product" })
public class RegisterProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		String productName = request.getParameter("productName");
		String productBranchCode = request.getParameter("productBranch");
		String productTypeCode = request.getParameter("productType");
		BigDecimal productQuantity = new BigDecimal(request.getParameter("productQuantity"));
		String productMeasurementUnitCode = request.getParameter("productMeasurementUnit");
		String[] productCategoriesCodes = request.getParameter("productCategories").split(",");
		
		Map<String,Object> operationResponse;
		
		if (productName != null && productBranchCode != null && productTypeCode != null && productQuantity != null && productMeasurementUnitCode != null && productCategoriesCodes.length != 0) {
			
			operationResponse = ProductsDAO.registerProduct(productName,productBranchCode,productTypeCode,productQuantity,productMeasurementUnitCode,productCategoriesCodes);
		
		} else {
			
			operationResponse = new HashMap<>();
			operationResponse.put("status", false);
			operationResponse.put("content", null);
			operationResponse.put("errorMessage", "Parámetros recibidos no deseados!");
		}
		
		response.getWriter().append(new Gson().toJson(operationResponse));
	}
}
