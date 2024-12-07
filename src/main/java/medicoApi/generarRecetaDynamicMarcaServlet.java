package medicoApi;

import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import medicoDAO.GetMarcaDAO;

/**
 * Servlet implementation class generarRecetaDynamicMarcaServlet
 */
@WebServlet(description = "para generar la marca de cada producto", urlPatterns = { "/api/generarRecetaDynamicMarca" })
public class generarRecetaDynamicMarcaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public generarRecetaDynamicMarcaServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("application/json");
    	
    	String idProducto = request.getParameter("idProduct");
    	GetMarcaDAO gm = new GetMarcaDAO(idProducto);
    	try {
			response.getWriter().append(gm.getMarca());
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
	}
}

