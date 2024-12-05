package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import DataBase.DataBaseConnection;

public class ProductCatalogsDAO {

	public static Map<String, Object> getProductBranchesAndTypes() throws SQLException, ClassNotFoundException {
		
		String getBranchesQuery = "Select Nombre,Codigo FROM MarcasDeProductos WHERE Activo LIKE 1;";
		String getTypesQuery = "Select Nombre,Codigo FROM TiposDeProductos WHERE Activo LIKE 1;";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();
		
		PreparedStatement getBranchesStatement = connection.prepareStatement(getBranchesQuery);
		PreparedStatement getTypesStatement = connection.prepareStatement(getTypesQuery);
		
		ResultSet branchesResultSet = getBranchesStatement.executeQuery();
		ResultSet typesResultSet = getTypesStatement.executeQuery();
		
		Map<String,Object> response;
		
		List<Object> branches = new LinkedList<>();
		List<Object> types = new LinkedList<>();
		
		Map<String,String> branchesInformation;
		Map<String,String> typesInformation;
		
		while (branchesResultSet.next()) {
			
			branchesInformation = new HashMap<>();
			branchesInformation.put("name",branchesResultSet.getString(1));
			branchesInformation.put("code",branchesResultSet.getString(2));
			
			branches.add(branchesInformation);
		}
		
		while (typesResultSet.next()) {
			
			typesInformation = new HashMap<>();
			typesInformation.put("name", typesResultSet.getString(1));
			typesInformation.put("code", typesResultSet.getString(2));
			
			types.add(typesInformation);
		}
		
		response = new HashMap<>();
		response.put("branches", branches);
		response.put("types", types);
		
		return response;
	}

	public static Map<String, Object> getMeasurementUnit(String typeCode) throws ClassNotFoundException, SQLException {
		
		String query = "SELECT U.Nombre,U.Codigo FROM UnidadesDeMedida U INNER JOIN TiposDeProductos T ON U.Id = T.UnidadMedidaId WHERE T.Codigo LIKE ?;";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		statement.setString(1, typeCode);
		
		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response;
		
		Map<String,String> measurementUnit = new HashMap<>();
		
		while (resultSet.next()) {
			
			measurementUnit.put("name", resultSet.getString(1));
			measurementUnit.put("code", resultSet.getString(2));
		}
		
		response = new HashMap<>();
		response.put("measurementUnit", measurementUnit);
		
		return response;
	}

	public static Map<String, Object> getProductCategories() throws ClassNotFoundException, SQLException {
		
		String query = "SELECT Nombre,Codigo FROM CategoriasDeProductos WHERE Activo = 1;";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response;
		
		List<Object> productCategories = new LinkedList<>();
		
		Map<String,String> category;
		
		while (resultSet.next()) {
			
			category = new HashMap<>();
			category.put("name", resultSet.getString(1));
			category.put("code", resultSet.getString(2));
			
			productCategories.add(category);
		}
		
		response = new HashMap<>();
		response.put("productCategories", productCategories);
		
		return response;
	}

}
