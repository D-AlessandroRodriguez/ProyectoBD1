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
 * Clase que accede a la base de datos para obtener los productos relacionados a una receta determinada.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/11/27
 * @date 2024/11/27
 */
public class RecipeProductsDAO {
	
	/**
	 * Método para obtener de la base de datos a los productos relacionados con la receta de id pasado como parámetro.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/27
	 * @param recipeId Id de la receta de la cuál se quiere obtener sus productos.
	 * @return Una cadena en formato de arreglo Json con los registros de productos en formato Json.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos. 
	 */
	public static String getRecipeProducts(int recipeId) throws ClassNotFoundException, SQLException {
		
		String query = "SELECT * FROM dbo.obtenerProductosDeReceta(?);";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();

		PreparedStatement statement = connection.prepareStatement(query);
		
		statement.setInt(1, recipeId);
		
		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		List<Object> recipeProducts = new ArrayList<>();
		
		Map<String,String> product = new HashMap<>();
		
		product.put("id", "L-20241203120554234");
		product.put("nombre", "Acetaminofén");
		product.put("marca", "Bayer");
		product.put("tipo", "Tableta");
		product.put("cantidad", "5");
		product.put("cantidadDosis", "500");
		product.put("unidad", "miligramo(s)");
		product.put("frecuencia", "8");
		
		recipeProducts.add(product);
		
		while (resultSet.next()) {
			
			product = new HashMap<>();
			
			product.put("id", resultSet.getString(1));
			product.put("nombre", resultSet.getString(2));
			product.put("marca", resultSet.getString(3));
			product.put("tipo", resultSet.getString(4));
			product.put("cantidad", resultSet.getString(5));
			product.put("cantidadDosis", resultSet.getString(6));
			product.put("unidad", resultSet.getString(7));
			product.put("frecuencia", resultSet.getString(8));
			
			recipeProducts.add(product);
		}
		
		response.put("data", recipeProducts);
		
		return new Gson().toJson(response);
	}
}