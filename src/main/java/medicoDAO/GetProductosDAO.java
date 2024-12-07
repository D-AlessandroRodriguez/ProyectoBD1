package medicoDAO;

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
 * hace un select de todos los productos existentes de la base de datos
 * 
 * @author cdcruz@unah.hn
 * @version 0.0.1
 * @since 2024/12/1
 * @date 2024/12/1
 * */
public class GetProductosDAO {
	/**
	 * metodo para obtener los id y nombres de la base de datos
	 * 
	 * @author cdcruz@unah.hn
	 * @version 0.0.1
	 * @since 2024/12/1
	 * @date 2024/12/1
	 * 
	 * @return retorna un JSON donde va la informacion de la marca para llenar el select marca
	 */
	public String getProductos() throws ClassNotFoundException, SQLException{
		Map<String,Object> producto;
		
		String queryProductos = "SELECT Id, NombreComercial FROM Productos";
		Connection connection = new DataBaseConnection("medico","medico123").getConnection();
		
		PreparedStatement ps = connection.prepareStatement(queryProductos);
		ResultSet rs = ps.executeQuery();
		
		List<String> listProductos = new ArrayList<>();
		int counter = 1;
		while(rs.next()) {
			producto = new HashMap<>();
			producto.put("id", counter);
			producto.put("IdProducto", rs.getString(1));
			producto.put("NombreComercial", rs.getString(2));
			
			listProductos.add(new Gson().toJson(producto));
			counter++;
		}
		return String.format("{\"productos\": %s}", new Gson().toJson(listProductos));
	}
}
