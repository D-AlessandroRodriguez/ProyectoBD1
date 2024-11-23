package api;

import java.io.IOException;
import java.sql.SQLException;

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
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		
		
	    //extraer los roles y permisos
		UserDAO userExists = new UserDAO(username, password);
		RolesPermissionDAO user = new RolesPermissionDAO();
		
	    //verificar que existe el usuario y crea una session
	    if (userExists.isUser() != false) {
	    		
	    	//HttpSession session = request.getSession();
	    	//session.setAttribute("rolesPermisos", user.getPermissionsForRole(userExists.idUser()));
			
	        response.sendRedirect("medico.jsp");
	    } else {
	        response.sendRedirect("login.jsp?error=Invalid credentials");
	    }
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
