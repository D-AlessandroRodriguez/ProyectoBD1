package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import DataBase.DataBaseConnection;
import time.TimeAndDate;

/**
 * Clase que accede a la base de datos para obtener información de los lotes de un producto.
 * @author jesus.zepeda@unah.hn
 * @version 0.2.0
 * @since 2024/11/26
 * @date 2024/11/29
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
		
		String query = "SELECT COUNT(*) FROM dbo.obtenerLotesDeProducto(?)";
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		statement.setString(1, productId);
		
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
	 * @version 0.2.0
	 * @since 2024/11/26
	 * @date 2024/11/29
	 * @param productId El Id del producto del cuál se quiere obtener sus lotes.
	 * @param start Indica el índice de registro a partir del cuál se empezará a seleccionar.
	 * @param length Indica la cantidad de registros que se espera seleccionar.
	 * @param searchValue Indica el valor a ser buscado en las columnas de cada registro para especificar éstos aún más.
	 * @param orderColumnIndex Indica el índice de la columna por la cual se aplicará la instrucción ORDER BY en la consulta a realizar.
	 * @param orderDirection Indica la dirección de ordenado.
	 * @return Un mapa convertible en Json con los datos extraídos de la base de datos y con información adicional necesaria para dar respuesta al Frontend.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static Map<String,Object> getProductBatches(String productId, int start, int length, String searchValue, int orderColumnIndex, String orderDirection) throws ClassNotFoundException, SQLException {
			
		String query = null;
		
		if (orderColumnIndex == 0 && orderDirection == null) {
			
			query = "SELECT * FROM dbo.obtenerLotesDeProducto(?) WHERE (id LIKE ? OR CantidadIngresada LIKE ? OR FechaIngreso LIKE ? OR FechaElaboracion LIKE ? OR FechaVencimiento LIKE ? OR CantidadActual LIKE ?) ORDER BY id ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
		
		} else {
			
			if (orderColumnIndex >= 0 && orderColumnIndex < 6) {
				
				if ("ASC".equalsIgnoreCase(orderDirection)) {
					
					query = String.format("SELECT * FROM dbo.obtenerLotesDeProducto(?) WHERE (id LIKE ? OR CantidadIngresada LIKE ? OR FechaIngreso LIKE ? OR FechaElaboracion LIKE ? OR FechaVencimiento LIKE ? OR CantidadActual LIKE ?) ORDER BY %s ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
				
				} else if ("DESC".equalsIgnoreCase(orderDirection)) {
					
					query = String.format("SELECT * FROM dbo.obtenerLotesDeProducto(?) WHERE (id LIKE ? OR CantidadIngresada LIKE ? OR FechaIngreso LIKE ? OR FechaElaboracion LIKE ? OR FechaVencimiento LIKE ? OR CantidadActual LIKE ?) ORDER BY %s DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;", orderColumnIndex+1);
				}
			}
		}
		
		Connection connection = new DataBaseConnection("farmaceutico","jesus123").getConnection();		
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		statement.setString(1,productId);
		statement.setString(2, searchValue+"%");
		statement.setString(3, searchValue+"%");
		statement.setString(4, searchValue+"%");
		statement.setString(5, searchValue+"%");
		statement.setString(6, searchValue+"%");
		statement.setString(7, searchValue+"%");
		statement.setInt(8, start);
		statement.setInt(9, length);
		
		ResultSet resultSet = statement.executeQuery();
		
		Map<String,Object> response = new HashMap<>();
		
		List<Object> batches = new ArrayList<>();
		
		Map<String,String> batch;
		
		while (resultSet.next()) {
			
			batch = new HashMap<>();
			
			batch.put("id", resultSet.getString(1));
			batch.put("cantidadIngresada", resultSet.getString(2));
			batch.put("fechaIngreso", resultSet.getString(3));
			batch.put("fechaElaboracion", resultSet.getString(4));
			batch.put("fechaVencimiento", resultSet.getString(5));
			batch.put("cantidadActual", resultSet.getString(6));	
			
			batches.add(batch);
		}
		
		response.put("recordsTotal", String.format("%s", getBatchesCount(productId)));
		response.put("recordsFiltered", String.format("%s", batches.size()));
		response.put("data", batches);
		
		connection.close();
		
		return response;
	}
	
	/**
	 * Método que se encarga de acceder a la base de datos para registrar un lote de producto y luego registrar el movimiento de inventario.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @param productId Id del producto a registrar un lote.
	 * @param productionDate Fecha de elaboración del lote a registrar.
	 * @param expirationDate Fecha de expiración del lote a registrar.
	 * @param batchQuantity Cantidad de productos del lote a registrar.
	 * @return Mapa convertible en Json con el id del lote registrado, confirmando así que el registro del lote fue exitoso.
	 */
	public static Map<String, String> registerBatch(String productId, String productionDate, String expirationDate, int batchQuantity) {
		
		String registerBatchQuery = "{CALL dbo.registrarLote(?, ?, ?, ?, ?, ?, ?)}";
		
		String registerMovementQuery = "{CALL dbo.registrarMovimientoInventario(?, ?, ?, ?, ?, ?)}";
		
		String batchId;
		
		Map<String,String> batchIdResponse;
		
		try (Connection connection = new DataBaseConnection("farmaceutico", "jesus123").getConnection()) {
			
			connection.setAutoCommit(false);
			
			try {
				
				CallableStatement registerBatchStatement = connection.prepareCall(registerBatchQuery);
				
				batchId = getBatchId();
				
				registerBatchStatement.setString(1, batchId);
				registerBatchStatement.setString(2, productId);
				registerBatchStatement.setDate(3, Date.valueOf(TimeAndDate.getCurrentDate("YYYY-MM-dd")));
				registerBatchStatement.setDate(4, Date.valueOf(productionDate));
				registerBatchStatement.setDate(5, Date.valueOf(expirationDate));
				registerBatchStatement.setInt(6,batchQuantity);				
				registerBatchStatement.setInt(7,batchQuantity);
				
				registerBatchStatement.execute();
				
				CallableStatement registerMovementStatement = connection.prepareCall(registerMovementQuery);
				
				registerMovementStatement.setString(1,getMovementId());
				registerMovementStatement.setDate(2, Date.valueOf(TimeAndDate.getCurrentDate("YYYY-MM-dd")));
				registerMovementStatement.setInt(3, 1);
				registerMovementStatement.setString(4, productId);
				registerMovementStatement.setInt(5, batchQuantity);
				registerMovementStatement.setString(6, batchId);
				
				registerMovementStatement.execute();
				
				connection.commit();
				
				batchIdResponse = new HashMap<>();
				batchIdResponse.put("batchId", batchId);
				
				connection.close();
				
				return batchIdResponse;
				
			} catch (SQLException e) {
				
				connection.rollback();
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	/**
	 * Método que se encarga de generar un id de Movimiento para el registro de un nuevo movimiento de producto en la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @return Una cadena que representa a un id de Movimiento.
	 */
	private static String getMovementId() {
		// TODO Auto-generated method stub
		String movementId = new String("M-" + TimeAndDate.getCurrentDate("YYYYMMddhhmmssSSS"));
		return movementId;
	}

	/**
	 * Método que se encarga de generar un id de lote para el registro de un nuevo lote de producto en la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @return Una cadena que representa a un id de lote.
	 */
	private static String getBatchId() {
		// TODO Auto-generated method stub
		String batchId = new String("L-" + TimeAndDate.getCurrentDate("YYYYMMddhhmmssSSS"));
		return batchId;
	}
}