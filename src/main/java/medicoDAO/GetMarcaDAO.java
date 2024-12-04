package medicoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
/**
 * hace un select a la marca con el id del producto
 * 
 * @author cdcruz@unah.hn
 * @version 0.0.1
 * @since 2024/12/1
 * @date 2024/12/1
 * */
public class GetMarcaDAO {
	private String idProducto;
	
	public GetMarcaDAO(String idProducto) {
		this.idProducto = idProducto;
	}

	/**
	 * metodo para obtener la data de la marca
	 * @author cdcruz@unah.hn
	 * @version 0.0.1
	 * @since 2024/12/1
	 * @date 2024/12/1
	 * 
	 * @return retorna un JSON donde va la informacion de la marca para llenar el select marca
	 */
	public String getMarca() throws ClassNotFoundException, SQLException {
		String query = "SELECT M.Id, M.Nombre FROM Productos P INNER JOIN MarcasDeProductos M ON P.MarcaId = M.Id WHERE P.Id= ?";
		
		Connection connection = new DataBaseConnection("medico","medico123").getConnection();

		PreparedStatement statement1 = connection.prepareStatement(query);
		statement1.setString(1, this.idProducto);
		
		ResultSet rs = statement1.executeQuery();
		int id = 0;
		String nombre = "";
		while(rs.next()) {
			id = rs.getInt(1);
			nombre = rs.getString(2);
		}
		return String.format("{\"marcaId\": %d, \"marcaName\": \"%s\"}", id, nombre);
	}
}
