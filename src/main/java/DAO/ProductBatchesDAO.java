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
 * Clase que accede a la base de datos para obtener información de los lotes de un producto.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/11/26
 * @date 2024/11/26
 */
public class ProductBatchesDAO {
	
	/**
	 * Método para obtener la cantidad de registros (lotes) que posee un producto.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/26
	 * @date 2024/11/26
	 * @param productId El Id del producto del cuál se quiere saber la cantidad de lotes.
	 * @return La cantidad de registros de lotes pertenecientes al producto con el Id pasado como parámetro.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException	Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	private static int getBatchesCount(String productId) throws ClassNotFoundException, SQLException {
		
		String query = "SELECT COUNT(*) FROM dbo.obtenerLotesDeProducto('"+productId+"')";
		
		Connection connection = DataBaseConnection.getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		ResultSet resultSet = statement.executeQuery();
		
		int batchesCount = 0;
		
		if (resultSet.next()) {
			batchesCount = resultSet.getInt(1);
		}
		
		connection.close();
		
		return batchesCount;
	}
	
	/**
	 * Método que obtiene todos los lotes registrados de un producto de la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/26
	 * @date 2024/11/26
	 * @param productId El Id del producto del cuál quiero obtener sus lotes.
	 * @param start Indica el índice de registro a partir del cuál se empezará a seleccionar.
	 * @param length Indica la cantidad de registros que se espera seleccionar.
	 * @param searchValue Indica el valor a ser buscado en las columnas de cada registro para especificar éstos aún más.
	 * @param orderColumnName Indica el nombre de la columna por la cual se aplicará la instrucción ORDER BY en la consulta a realizar.
	 * @param orderDirection Indica la dirección de ordenado.
	 * @return Un mapa convertible en Json con los datos extraídos de la base de datos y con información adicional necesaria para dar respuesta al Frontend.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static Map<String,Object> getProductBatches(String productId, int start, int length, String searchValue, String orderColumnName, String orderDirection) throws ClassNotFoundException, SQLException {
			
		String query = "SELECT * FROM dbo.obtenerLotesDeProducto('"+productId+"') WHERE (id LIKE '"+searchValue+"%' OR CantidadIngresada LIKE '"+searchValue+"%' OR FechaIngreso LIKE '"+searchValue+"%' OR FechaElaboracion LIKE '"+searchValue+"%' OR FechaVencimiento LIKE '"+searchValue+"%' OR CantidadActual LIKE '"+searchValue+"%') ORDER BY '"+orderColumnName+"' "+orderDirection+" OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
		
		Connection connection = DataBaseConnection.getConnection();		
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		statement.setInt(1, start);
		statement.setInt(2, length);
		
		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		List<String> batches = new ArrayList<>();
		
		Map<String,String> batch;
		
		while (resultSet.next()) {
			
			batch = new HashMap<>();
			
			batch.put("id", resultSet.getString(1));
			batch.put("cantidadIngresada", resultSet.getString(2));
			batch.put("fechaIngreso", resultSet.getString(3));
			batch.put("fechaElaboracion", resultSet.getString(4));
			batch.put("fechaVencimiento", resultSet.getString(5));
			batch.put("cantidadActual", resultSet.getString(6));	
			
			batches.add(new Gson().toJson(batch));
		}
		
		response.put("recordsTotal", String.format("%s", getBatchesCount(productId)));
		response.put("recordsFiltered", String.format("%s", batches.size()));
		response.put("data", batches);
		
		return response;
	}
}