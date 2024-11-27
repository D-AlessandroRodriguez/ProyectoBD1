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
 * Clase que accede a la base de datos para obtener información de los productos.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/11/26
 * @date 2024/11/26
 */
public class ProductsDAO {
	
	/**
	 * Método para obtener la cantidad de productos registrados (no de inventario) en la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/26
	 * @date 2024/11/26
	 * @return La cantidad de productos que hay en la base de datos. (no de inventario).
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException	Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	private static int getProductsCount() throws ClassNotFoundException, SQLException {
		
		String query = "SELECT COUNT(*) FROM Productos";
		
		Connection connection = DataBaseConnection.getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		ResultSet resultSet = statement.executeQuery();
		
		int productsCount = 0;
		
		if (resultSet.next()) {
			productsCount = resultSet.getInt(1);
		}
		
		connection.close();
		
		return productsCount;
	}

	/**
	 * Método que obtiene todos los productos registrados de la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/26
	 * @date 2024/11/26
	 * @param start Indica el índice de registro a partir del cuál se empezará a seleccionar.
	 * @param length Indica la cantidad de registros que se espera seleccionar.
	 * @param searchValue Indica el valor a ser buscado en las columnas de cada registro para especificar éstos aún más.
	 * @param orderColumnName Indica el nombre de la columna por la cual se aplicará la instrucción ORDER BY en la consulta a realizar.
	 * @param orderDirection Indica la dirección de ordenado.
	 * @return Un mapa convertible en Json con los datos extraídos de la base de datos y con información adicional necesaria para dar respuesta al Frontend.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static Map<String,Object> getProducts(int start, int length, String searchValue, String orderColumnName, String orderDirection) throws ClassNotFoundException, SQLException {

		String query = "SELECT * FROM VistaProductos WHERE (id LIKE '" +searchValue+ "%' OR nombre LIKE '"+searchValue+"%' OR marca LIKE '"+searchValue+"%' OR tipo LIKE '"+searchValue+"%' OR contenido LIKE '"+searchValue+"%' OR stock LIKE '"+searchValue+"%') ORDER BY '"+orderColumnName+"' "+orderDirection+" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";

		Connection connection = DataBaseConnection.getConnection();

		PreparedStatement statement = connection.prepareStatement(query);

		statement.setInt(1, start);
		statement.setInt(2, length);

		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		List<String> products = new ArrayList<>();
		
		Map<String,String> product;
		
		while (resultSet.next()) {
			
			product = new HashMap<>();
			
			product.put("id", resultSet.getString(1));
			product.put("nombre", resultSet.getString(2));
			product.put("marca", resultSet.getString(3));
			product.put("tipo", resultSet.getString(4));
			product.put("contenido", String.format("%s %s", resultSet.getString(5), resultSet.getString(6)));
			product.put("stock", resultSet.getString(7));
			product.put("accion", resultSet.getString(1));
			
			products.add(new Gson().toJson(product));
		}
		
		response.put("recordsTotal", String.format("%s", getProductsCount()));
		response.put("recordsFiltered", String.format("%s", products.size()));
		response.put("data", products);
		
		return response;
	}
	
	/**
	 * Método que el nombre del producto con el Id pasado como parámetro.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/26
	 * @date 2024/11/26
	 * @param productId Id del producto a ser buscado en la base de datos para obtener su nombre.
	 * @return El nombre del producto con el Id pasado como parámetro.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static String getProductName(String productId) throws ClassNotFoundException, SQLException {

		String query = "SELECT * FROM VistaProductos WHERE nombre LIKE '"+productId+"';";

		Connection connection = DataBaseConnection.getConnection();

		PreparedStatement statement = connection.prepareStatement(query);

		ResultSet resultSet = statement.executeQuery();
		
		if (resultSet.next()) {
			
			return resultSet.getString(1);
		}
		
		return null;
	}
}