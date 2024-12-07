package DAO;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import DataBase.DataBaseConnection;
import time.TimeAndDate;

/**
 * Clase que accede a la base de datos para registrar productos o para obtener información de los productos.
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
		
		String query = "SELECT COUNT(*) FROM VistaProductos";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();
		
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
	 * @version 0.2.0
	 * @since 2024/11/26
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
	public static Map<String,Object> getProductsForDataTable(int start, int length, String searchValue, int orderColumnIndex, String orderDirection) throws ClassNotFoundException, SQLException {
		
		String query = null;
		
		if (orderColumnIndex == 0 && orderDirection == null) {
			
			//consulta por defecto con filtro por default
			query = "SELECT * FROM VistaProductos WHERE (id LIKE ? OR nombre LIKE ? OR marca LIKE ? OR tipo LIKE ? OR contenido LIKE ? OR stock LIKE ?) ORDER BY nombre ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
		
		} else {
			
			if (orderColumnIndex >= 0 && orderColumnIndex < 7) {
				
				if ("ASC".equalsIgnoreCase(orderDirection)) {
					
					query = String.format("SELECT * FROM VistaProductos WHERE (id LIKE ? OR nombre LIKE ? OR marca LIKE ? OR tipo LIKE ? OR contenido LIKE ? OR stock LIKE ?) ORDER BY %s ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
					
				} else if ("DESC".equalsIgnoreCase(orderDirection)) {
					
					query = String.format("SELECT * FROM VistaProductos WHERE (id LIKE ? OR nombre LIKE ? OR marca LIKE ? OR tipo LIKE ? OR contenido LIKE ? OR stock LIKE ?) ORDER BY %s DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
				}
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
		statement.setInt(7, start);
		statement.setInt(8, length);

		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		List<Object> products = new ArrayList<>();
		
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
			
			products.add(product);
		}
		
		response.put("recordsTotal", String.format("%s", getProductsCount()));
		response.put("recordsFiltered", String.format("%s", products.size()));
		response.put("data", products);
		
		connection.close();
		
		return response;
	}
	
	/**
	 * Método que el nombre del producto con el Id pasado como parámetro.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/11/26
	 * @date 2024/11/29
	 * @param productId Id del producto a ser buscado en la base de datos para obtener su nombre.
	 * @return El nombre del producto con el Id pasado como parámetro.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static String getProductName(String productId) throws ClassNotFoundException, SQLException {

		String query = "SELECT nombre FROM VistaProductos WHERE id LIKE ?;";

		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();

		PreparedStatement statement = connection.prepareStatement(query);
		
		statement.setString(1, productId);

		ResultSet resultSet = statement.executeQuery();
		
		if (resultSet.next()) {
			
			String productName = resultSet.getString(1);
			connection.close();
			
			return productName;
		}
		
		connection.close();
		
		return null;
	}
	
	/**
	 * Método que registra en la base de datos a un producto con su información.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/04
	 * @date 2024/12/04
	 * @param productName Nombre del producto a ser registrado.
	 * @param productBranchCode Código de la marcad del producto a ser registrado.
	 * @param productTypeCode Código del tipo del tipo de producto a ser registrado.
	 * @param productQuantity Cantidad de contenido del producto a ser registrado.
	 * @param productMeasurementUnitCode Código de la unidad de medida del contenido del producto a ser registrado.
	 * @param productCategoriesCodes Array de códigos de categorías del producto a ser registrado.
	 * @return Mapa convertible en Json para dar respuesta al cliente Frontend.
	 */
	public static Map<String, Object> registerProduct(String productName, String productBranchCode,
			String productTypeCode, BigDecimal productQuantity, String productMeasurementUnitCode,
			String[] productCategoriesCodes) {
		
		String productId = getProductId();
		
		String registerProductQuery = "{CALL dbo.registrarProductoFarmacia(?, ?, ?, ?, ?, ?)}";
		
		String registerProductCategoryQuery = "{CALL dbo.registrarCategoriaDeProducto(?, ?)}";
		
		Map<String,Object> response;
		
		try {
			Connection connection = new DataBaseConnection("farmaceutico", "jesus123").getConnection();
			
			connection.setAutoCommit(false);
			
			//Registrar el producto
			try (PreparedStatement insertProductStatement = connection.prepareCall(registerProductQuery)) {
				
				insertProductStatement.setString(1, productId);
				insertProductStatement.setString(2, productName);
				insertProductStatement.setString(3, productTypeCode);
				insertProductStatement.setString(4, productBranchCode);
				insertProductStatement.setString(5, productMeasurementUnitCode);
				insertProductStatement.setBigDecimal(6, productQuantity);
				
				insertProductStatement.execute();
				
				try (PreparedStatement insertCategoryProductStatement = connection.prepareCall(registerProductCategoryQuery)) {
					
					//Registrar las categorias del producto.
					for (int i = 0; i < productCategoriesCodes.length; i++) {
						
						insertCategoryProductStatement.setString(1, productId);
						insertCategoryProductStatement.setString(2, productCategoriesCodes[i]);
						
						insertCategoryProductStatement.execute();
					}
				}
				
				connection.commit();
				
				response = new HashMap<>();
				
				response.put("status", true);
				
				Map<String,String> productIdResponse = new HashMap<>();
				
				productIdResponse.put("productId", productId);
				
				response.put("content", productIdResponse);
				
				response.put("errorMessage", null);
				
				connection.close();
				
				return response;
				
			} catch (Exception e) {
				
				if (connection != null) {
					
					try {
	                    connection.rollback();
	                    connection.close();
	                    e.printStackTrace();
	                    
	                } catch (SQLException rollbackEx) {
	                	
	                    rollbackEx.printStackTrace();
	                }
				}
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
		response = new HashMap<>();
		response.put("status", false);
		response.put("content", null);
		response.put("errorMessage", "No se puedo registrar el producto!");
		
		return response;
	}
	
	/**
	 * Método que genera un id para identificar al producto a ser registrado.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/04
	 * @date 2024/12/04
	 * @return El id generado del producto a ser registrado.
	 */
	private static String getProductId() {
		// TODO Auto-generated method stub
		String productId = new String("P-"+TimeAndDate.getCurrentDate("YYYYMMddhhmmssSSS"));
		return productId;
	}

	/**
	 * Método que accede a la base de datos para recuperar los productos para ser mostrados en una DataList de bootstrap por el cliente Frontend.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @return Un mapa convertible a Json con los productos recolectados de la base de datos.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static Map<String, Object> getProductsForDataList() throws ClassNotFoundException, SQLException {
		
		String query = "SELECT * FROM VistaProductos;";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response;
		
		List<Object> products = new LinkedList<>();
		
		Map<String,String> product;
		
		while (resultSet.next()) {
			
			product = new HashMap<>();
			product.put("id", resultSet.getString(1));
			product.put("information", String.format("%s %s %s %s", resultSet.getString(1),resultSet.getString(2), resultSet.getString(3), resultSet.getString(4)));
			
			products.add(product);
		}
		
		response = new HashMap<>();
		response.put("products", products);
		
		connection.close();
		
		return response;
	}
}