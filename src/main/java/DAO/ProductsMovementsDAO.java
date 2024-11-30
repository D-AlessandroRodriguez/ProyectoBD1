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
 * Clase que accede a la base de datos para obtener el historial de movimientos de productos de la base de datos.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/11/29
 * @date 2024/11/29
 */
public class ProductsMovementsDAO {
	
	/**
	 * Método para obtener la cantidad de movimientos de productos registrados en la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/29
	 * @date 2024/11/29
	 * @return La cantidad de movimientos de productos que hay en la base de datos.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException	Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	private static int getProductsMovementsCount() throws ClassNotFoundException, SQLException {
		
		String query = "SELECT COUNT(*) FROM FichaInventario";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		ResultSet resultSet = statement.executeQuery();
		
		int productsMovementsCount = 0;
		
		if (resultSet.next()) {
			productsMovementsCount = resultSet.getInt(1);
		}
		
		connection.close();
		
		return productsMovementsCount;
	}
	
	/**
	 * Método que obtiene los movimientos de productos de la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/29
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
	public static Map<String, Object> getProductsMovements(int start, int length, String searchValue, int orderColumnIndex, String orderDirection) throws ClassNotFoundException, SQLException {
		
		String query = null;
		
		if (orderColumnIndex >= 0 && orderColumnIndex <= 7) {
			
			if ("ASC".equalsIgnoreCase(orderDirection)) {
				
				query = String.format("SELECT * FROM VistaMovimientosProductos WHERE (id LIKE ? OR producto LIKE ? OR marca LIKE ? OR tipo LIKE ? OR lote LIKE ? OR movimiento LIKE ? OR cantidad LIKE ? OR fecha LIKE ?) ORDER BY %s ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
			
			} else if ("DESC".equalsIgnoreCase(orderDirection)) {
				
				query = String.format("SELECT * FROM VistaMovimientosProductos WHERE (id LIKE ? OR producto LIKE ? OR marca LIKE ? OR tipo LIKE ? OR lote LIKE ? OR movimiento LIKE ? OR cantidad LIKE ? OR fecha LIKE ?) ORDER BY %s DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
			}
		}
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();

		PreparedStatement statement = connection.prepareStatement(query);
		
		statement.setString(1, searchValue+"%");
		statement.setString(2, searchValue+"%");
		statement.setString(3, searchValue+"%");
		statement.setString(4, searchValue+"%");
		statement.setString(5, searchValue+"%");
		statement.setString(6, searchValue+"%");
		statement.setString(7, searchValue+"%");
		statement.setString(8, searchValue+"%");
		statement.setInt(9, start);
		statement.setInt(10, length);
		
		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		List<String> movements = new ArrayList<>();
		
		Map<String,String> movement;
		
		while (resultSet.next()) {
			
			movement = new HashMap<>();
			
			movement.put("id", resultSet.getString(1));
			movement.put("producto", resultSet.getString(2));
			movement.put("marca", resultSet.getString(3));
			movement.put("tipo", resultSet.getString(4));
			movement.put("lote", resultSet.getString(5));
			movement.put("movimiento", resultSet.getString(6));
			movement.put("cantidad", resultSet.getString(7));
			movement.put("fecha", resultSet.getString(7));
			
			movements.add(new Gson().toJson(movement));
		}
		
		response.put("recordsTotal", String.format("%s", getProductsMovementsCount()));
		response.put("recordsFiltered", String.format("%s", movements.size()));
		response.put("data", movements);
		
		connection.close();
		
		return response;
	}
}