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

/**
 * Clase que accede a la base de datos para obtener las órdenes de recetas registradas y que no están atendidas.
 * @author jesus.zepeda@unah.hn
 * @version 0.2.0
 * @since 2024/11/27
 * @date 2024/11/29
 */
public class RecipeOrdersDAO {
	
	
	/**
	 * Método para obtener la cantidad de órdenes de recetas registradas y que no están atendidas.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/27
	 * @return La cantidad de órdenes de recetas que hay en la base de datos (sin atender).
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException	Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	private static int getRecipeOrdersCount() throws ClassNotFoundException, SQLException {
		
		String query = "SELECT COUNT(*) FROM OrdenRecetas WHERE Atendida = 0;";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		ResultSet resultSet = statement.executeQuery();
		
		int recipeOrdersCount = 0;
		
		if (resultSet.next()) {
			recipeOrdersCount = resultSet.getInt(1);
		}
		
		connection.close();
		
		return recipeOrdersCount;
	}
	
	/**
	 * Método que obtiene todas las órdenes de recetas registradas de la base de datos y que no están atendidas.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/11/27
	 * @date 2024/11/29
	 * @param start Indica el índice de registro a partir del cuál se empezará a seleccionar.
	 * @param length Indica la cantidad de registros que se espera seleccionar.
	 * @param searchValue Indica el valor a ser buscado en las columnas de cada registro para especificar éstos aún más.
	 * @param orderColumnIndex Indica el índice de la columna por la cual se aplicará la instrucción ORDER BY en la consulta a realizar.
	 * @param orderDirection Indica la dirección de ordenado.
	 * @return Un mapa convertible en Json con los datos extraídos de la base de datos y con información adicional necesaria para dar respuesta al Frontend.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static Map<String,Object> getRecipeOrders(int start, int length, String searchValue, int orderColumnIndex, String orderDirection) throws ClassNotFoundException, SQLException {

//		String query = "SELECT * FROM VistaRecetas WHERE (id LIKE '"+searchValue+"%' OR paciente LIKE '"+searchValue+"%' OR medico LIKE '"+searchValue+"%' OR fecha LIKE '"+searchValue+"%') ORDER BY '"+orderColumnName+"' "+orderDirection+" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
		String query = null;
		
		if (orderColumnIndex >= 0 && orderColumnIndex <= 4) {
			
			if ("ASC".equalsIgnoreCase(orderDirection)) {
				
				query = String.format("SELECT * FROM VistaRecetas WHERE (id LIKE ? OR paciente LIKE ? OR medico LIKE ? OR fecha LIKE ?) ORDER BY %s ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
			
			} else if ("DESC".equalsIgnoreCase(orderDirection)) {
				
				query = String.format("SELECT * FROM VistaRecetas WHERE (id LIKE ? OR paciente LIKE ? OR medico LIKE ? OR fecha LIKE ?) ORDER BY %s DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
			}
		}

		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();

		PreparedStatement statement = connection.prepareStatement(query);

		statement.setString(1, searchValue+"%");
		statement.setString(2, searchValue+"%");
		statement.setString(3, searchValue+"%");
		statement.setString(4, searchValue+"%");
		statement.setInt(5, start);
		statement.setInt(6, length);

		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		List<String> recipeOrders = new ArrayList<>();
		
		Map<String,String> recipe;
		
		while (resultSet.next()) {
			
			recipe = new HashMap<>();
			
			recipe.put("id", resultSet.getString(1));
			recipe.put("paciente", resultSet.getString(2));
			recipe.put("medico", resultSet.getString(3));
			recipe.put("fecha", resultSet.getString(4));
			recipe.put("accion", resultSet.getString(1));
			
			recipeOrders.add(new Gson().toJson(recipe));
		}
		
		response.put("recordsTotal", String.format("%s", getRecipeOrdersCount()));
		response.put("recordsFiltered", String.format("%s", recipeOrders.size()));
		response.put("data", recipeOrders);
		
		return response;
	}
}