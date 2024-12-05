package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import DataBase.DataBaseConnection;

public class EmployeesDAO {
	
	
	public static Map<String,Object> getEmployeeData(int start, int length, String searchValue, int orderColumnIndex, String orderDirection) throws ClassNotFoundException, SQLException {

		String query = null;
		
		if (orderColumnIndex >= 0 && orderColumnIndex <= 4) {
			
			if ("ASC".equalsIgnoreCase(orderDirection)) {
				
				query = String.format("SELECT * FROM VistaEmpleados WHERE (Id LIKE ? OR N1 LIKE ? OR AP1 LIKE ? OR departamento LIKE ? OR Cargo LIKE ? OR Usuario LIKE ?) ORDER BY %s ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
			
			} else if ("DESC".equalsIgnoreCase(orderDirection)) {
				
				query = String.format("SELECT * FROM VistaEmpleados WHERE (Id LIKE ? OR N1 LIKE ? OR AP1 LIKE ? OR departamento LIKE ? OR Cargo LIKE ? OR Usuario LIKE ?) ORDER BY %s DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
			}
		}

		Connection connection = new DataBaseConnection("admin","admin1").getConnection();

		PreparedStatement statement = connection.prepareStatement(query);

		statement.setString(1, searchValue+"%");
		statement.setString(2, searchValue+"%");
		statement.setString(3, searchValue+"%");
		statement.setString(4, searchValue+"%");
		statement.setInt(5, start);
		statement.setInt(6, length);

		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		List<String> employees = new ArrayList<>(); // almacena todos los empleados
		
		Map<String,String> employee; // almacena un solo empleado
		
		while (resultSet.next()) {
			
			employee = new HashMap<>();
			
			employee.put("id", resultSet.getString(1));
			employee.put("nombre1", resultSet.getString(2));
			employee.put("apellido1", resultSet.getString(3));
			employee.put("departamento", resultSet.getString(4));
			employee.put("cargo", resultSet.getString(5));
			employee.put("usuario", resultSet.getString(6));
			employee.put("perfil", resultSet.getString(1));
			
			employees.add(new Gson().toJson(employee));
		}
		
		//response.put("recordsTotal", String.format("%s", getRecipeOrdersCount()));
		response.put("employeesFiltered", String.format("%s", employees.size()));
		response.put("data", employees);
		
		return response;
	}
}
