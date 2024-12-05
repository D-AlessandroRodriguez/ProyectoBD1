package api;

import java.io.IOException;

import DAO.RolesPermissionDAO;
import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

	/**
	 * Servlet para logiarse
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @date 2024/08/15
	 * @since 2024/08/15
	 * */
@WebServlet(description = "se almacena la sesion presente", urlPatterns = { "/session" })
public class sessionLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public sessionLogin() {
        super();
    }
    /**
     * metodo donde recibimos la peticion del login para poder entrar
     * @author cdcruzr@unah.hn
     * @version 0.1.0
     * @date 2024/11/16
     * @since 2024/11/16
     * */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
	
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(username);
		
	    //extraer los roles y permisos
		UserDAO userExists = new UserDAO(username, password);
		RolesPermissionDAO user = new RolesPermissionDAO();
		
	    //verificar que existe el usuario y crea una session
	    if (userExists.isUser() != false) {
	    	HttpSession session = request.getSession();
	    	session.setAttribute("user", username);
	    	
	    	response.getWriter().append("{\"status\":true}");
	    	//response.sendRedirect(request.getContextPath() + "/assets/medico/view/viewMedico.jsp");
	    } else {
	    	response.getWriter().append("{\"status\": "
	    			+ "false, \"message\":\"credenciales invalidas\"}");
	    	//response.sendRedirect(request.getContextPath() + "/index.jsp?error=Invalid%20credentials");
	    }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
