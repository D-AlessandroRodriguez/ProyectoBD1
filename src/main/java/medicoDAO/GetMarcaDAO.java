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
		String queryMarca = "SELECT M.Id, M.Nombre FROM Productos P INNER JOIN MarcasDeProductos M ON P.MarcaId = M.Id WHERE P.Id= ?";
		String queryUM = "SELECT U.Id, U.Nombre, U.Codigo FROM Productos P INNER JOIN UnidadesDeMedida U ON P.MarcaId = U.Id WHERE P.Id=  ?";
		
		String unidadMedida = "";
		String marca = "";
		
		Connection connection = new DataBaseConnection("medico","medico123").getConnection();

		PreparedStatement statement1 = connection.prepareStatement(queryMarca);
		statement1.setString(1, this.idProducto);
		ResultSet rs1 = statement1.executeQuery();
		int id = 0;
		String nombre = "";
		if(rs1.next()) {
			id = rs1.getInt(1);
			nombre = rs1.getString(2);
			marca = String.format("\"marca\":{\"marcaId\": %d, \"marcaName\": \"%s\"}", id, nombre);
		}
		
		//Para extraer la unidad de medida
		PreparedStatement statement2 = connection.prepareStatement(queryUM);
		statement2.setString(1, this.idProducto);
		ResultSet rs2 = statement2.executeQuery();
		
		int idUM = 0;
		String nombreUM = "";
		String codigo = "";
		if(rs2.next()) {
			idUM = rs2.getInt(1);
			nombreUM = rs2.getString(2);
			codigo = rs2.getString(3);
			unidadMedida = String.format("\"unidad\":{\"unidadId\": %d, \"unidadName\": \"%s\", \"codigo\": \"%s\"}", idUM, nombreUM, codigo);
		}
		
		return String.format("{%s, %s}", marca, unidadMedida);
	}
}
