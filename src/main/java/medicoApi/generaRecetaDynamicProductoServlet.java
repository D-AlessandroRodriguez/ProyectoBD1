package medicoApi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import medicoDAO.GetProductosDAO;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(description = "recibe la data para hacer  dinamico el select del producto y su marca", urlPatterns = { "/api/generaRecetaDynamicProducto" })
public class generaRecetaDynamicProductoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public generaRecetaDynamicProductoServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("application/json");
    	
    	try {
			response.getWriter().append(new GetProductosDAO().getProductos());
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}
}
