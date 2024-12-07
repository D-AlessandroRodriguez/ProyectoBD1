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

/**
 * Clase que se encarga de la obtención de los catálogos que sirven para registrar un producto.
 * @author jesus.zepeda@unah.hn
 * @version 0.2.0
 * @since 2024/12/03
 * @date 2024/12/04
 */
public class ProductCatalogsDAO {
	
	/**
	 * Método que se encarga de obtener de la base de datos a los catálogos de marcas de productos y tipos de productos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 * @return Un mapa convertible en Json que contiene dos arreglos con los registros de los catálogos en formato Json.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException	Excepción que se produce cuando ocurre un error en la base de datos.
	 */
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
	
	/**
	 * Método que se encarga de obtener de la base de datos la unidad de medida referente a un tipo de producto.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 * @param typeCode Código (no Id) del tipo de producto del cuál se desea obtener su unidad de medida.
	 * @return Mapa convertible en Json que contiene la unidad de medida del tipo de datos en otro mapa convertible a Json.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException	Excepción que se produce cuando ocurre un error en la base de datos.
	 */
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
	
	/**
	 * Método que se encarga de obtener de la base de datos al catálogo de las categorías de productos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 * @return Un mapa convertible en Json con las categorías en lista de mapas convertibles a Json.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException	Excepción que se produce cuando ocurre un error en la base de datos.
	 */
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
