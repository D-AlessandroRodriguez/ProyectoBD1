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

import DAO.EmployeesDAO;

/**
 * Servlet que obtiene los datos de los empleados de la base de datos
 * @author pnvarela@unah.hn
 * @version 0.1.0
 * @date 2024/12/04
 * @since 2024/12/03
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/api/GetEmployees"})
public class GetEmployeesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetEmployeesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    /**
	 * Método que recibe la petición POST del cliente Frontend para mostrar la información de los empleados
	 * @author jesus.zepeda@unah.hn
	 * @version 0.3.0
	 * @since 2024/11/26
	 * @date 2024/11/29
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		int draw = 0,start = 0,length = 0, orderColumnIndex = 0;
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
			
			Map<String,Object> dataTableResponse = EmployeesDAO.getEmployeeData(start, length, searchValue, orderColumnIndex, orderDirection);
			
			dataTableResponse.put("draw", String.format("%s", draw));
			
			System.out.println(new Gson().toJson(dataTableResponse));
			
			response.getWriter().append(new Gson().toJson(dataTableResponse));
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
