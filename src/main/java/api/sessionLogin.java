package api;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

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
		Map<String, Object> rolesPermisos;
		UserDAO userExists = new UserDAO(username, password);
		
	    //verificar que existe el usuario y crea una session
	    if (userExists.isUser() != false) {
	    	try {
				rolesPermisos = userExists.userInfo();
		    	HttpSession session = request.getSession();
		    	session.setAttribute("nombreUsuario", rolesPermisos.get("nombreUsuario"));
		    	session.setAttribute("rol", rolesPermisos.get("rol"));
		    	session.setAttribute("email", rolesPermisos.get("email"));
		    	session.setAttribute("empleadoId", rolesPermisos.get("empleadoId"));
		    	session.setAttribute("nombreEmpleado", rolesPermisos.get("nombreEmpleado"));
		    	response.getWriter().append("{\"status\":true}");
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
	    } else {
	    	response.getWriter().append("{\"status\": false, \"message\":\"credenciales invalidas\"}");
	    }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
