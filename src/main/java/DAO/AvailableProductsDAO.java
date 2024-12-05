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
 * Clase que accede a la base de datos para obtener los productos disponibles y no disponibles de una receta determinada.
 * @author jesus.zepeda@unah.hn
 * @version 0.2.0
 * @since 2024/11/28
 * @date 2024/11/29
 */
public class AvailableProductsDAO {
	
	/**
	 * Método para obtener de la base de datos a los productos de una receta determinada y calcular la cantidad de productos a entregar por lote y la cantidad faltante de productos a no ser entregados.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/28
	 * @date 2024/11/28
	 * @param recipeId Id de la receta de la cual se quiere obtener y calcular la disponibilidad de los productos relacionados a ella.
	 * @return Una cadena de texto en formato Json con los datos obtenidos y calculados de la base de datos (los productos a ser entregados y los faltantes).
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static String getAvailableProducts(int recipeId) throws ClassNotFoundException, SQLException {
		
		String query = "SELECT id,nombre,cantidad FROM dbo.obtenerProductosDeReceta(?)";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();

		PreparedStatement statement1 = connection.prepareStatement(query);
		
		statement1.setInt(1, recipeId);
		
		ResultSet resultSet = statement1.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		Map<String,Object> data = new HashMap<>();
		
		List<String> availableProducts = new ArrayList<>();
		List<String> nonAvailableProducts = new ArrayList<>();
		
		Map<String,String> product;
		
		while (resultSet.next()) {
			
			String productId = resultSet.getString(1);
			String productName = resultSet.getString(2);
			int requiredQuantity = resultSet.getInt(3);
			
			query = "SELECT id,CantidadActual FROM dbo.obtenerLotesDeUnProducto(?) WHERE CantidadActual > 0 ORDER BY FechaVencimiento ASC;";

			PreparedStatement statement2 = connection.prepareStatement(query);
			
			statement2.setString(1, productId);
			
			
			ResultSet batchesResultSet = statement2.executeQuery();
			
			while (batchesResultSet.next() && requiredQuantity > 0) {
				
				String batchId = batchesResultSet.getString(1);
				int currentBatchQuantity = batchesResultSet.getInt(2);
				
				int takedQuantity = Math.min(requiredQuantity,currentBatchQuantity);
				requiredQuantity -= takedQuantity;
				
				if (takedQuantity > 0) {
					
					product = new HashMap<>();
					product.put("productId", productId);
					product.put("batchId", batchId);					
					product.put("name", productName);
					product.put("quantity", String.format("%s", takedQuantity));
					
					availableProducts.add(new Gson().toJson(product));
				}
			}
			
			if (requiredQuantity > 0) {
				
				product = new HashMap<>();
				product.put("productId", productId);
				product.put("name", productName);
				product.put("quantity", String.format("%s", requiredQuantity));
				
				nonAvailableProducts.add(new Gson().toJson(product));
			}
		}
		
		data.put("availableProducts", availableProducts);
		data.put("nonAvailableProducts", nonAvailableProducts);
		
		response.put("data", data);
		
		return new Gson().toJson(response);
	}
}