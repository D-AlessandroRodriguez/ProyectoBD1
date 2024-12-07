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

public class PacientesDAO {
	
	
	public static Map<String,Object> getEmployeeData(int start, int length, String searchValue, int orderColumnIndex, String orderDirection) throws ClassNotFoundException, SQLException {

		String query = null;
		
		if (orderColumnIndex >= 0 && orderColumnIndex <= 4) {
			
			if ("ASC".equalsIgnoreCase(orderDirection)) {
				
				query = String.format("SELECT * FROM VistaPacientes WHERE (Id LIKE ? OR N1 LIKE ? OR AP1 LIKE ? OR dni LIKE ? OR telefono LIKE ? OR telefonoEmergencia LIKE ?) ORDER BY %s ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
			
			} else if ("DESC".equalsIgnoreCase(orderDirection)) {
				
				query = String.format("SELECT * FROM VistaPacientes WHERE (Id LIKE ? OR N1 LIKE ? OR AP1 LIKE ? OR dni LIKE ? OR telefono LIKE ? OR telefonoEmergencia LIKE ?) ORDER BY %s DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
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
		
		List<String> pacientes = new ArrayList<>(); // almacena todos los pacientes
		
		Map<String,String> paciente; // almacena un solo paciente
		
		while (resultSet.next()) {
			
			paciente = new HashMap<>();
			 
			paciente.put("id", resultSet.getString(1));
			paciente.put("nombre1", resultSet.getString(2));
			paciente.put("apellido1", resultSet.getString(3));
			paciente.put("dni", resultSet.getString(4));
			paciente.put("telefono", resultSet.getString(5));
			paciente.put("telefonoEmergencia", resultSet.getString(6));
			paciente.put("expediente", resultSet.getString(1));
			
			pacientes.add(new Gson().toJson(paciente));
		}
		
		//response.put("recordsTotal", String.format("%s", getRecipeOrdersCount()));
		response.put("recordsFiltered", String.format("%s", pacientes.size()));
		response.put("data", pacientes);
		
		return response;
	}
}
