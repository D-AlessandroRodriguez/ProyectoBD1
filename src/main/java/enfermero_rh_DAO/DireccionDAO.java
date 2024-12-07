package enfermero_rh_DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.Callable;

import DataBase.DataBaseConnection;
import services.Direccion;

/**
 * Crea una nueva direccion
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/27
 * @since 2024/11/27
 */
public class DireccionDAO {

	/**
	 * Crea una consulta y ejecuta una nueva inserccion de una direccion
	 * @param direccion Es un objeto que contiene contiene los valores a guaradar de una nueva direccion
	 *  @return returna un true si se ejecuta con exito
	 */
	private AccessDAO access = new AccessDAO();

	public boolean createDireccion(Direccion direccion) {
		String sql = "{CALL Insert_Direcciones(?,?,?,?,?,?)}";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			CallableStatement statement = conn.prepareCall(sql);

			statement.setInt(1, direccion.getPais());
			statement.setInt(2, direccion.getDepto());
			statement.setInt(3, direccion.getCiudad());
			statement.setInt(4, direccion.getColonia());
			statement.setString(5, direccion.getReferencia());

			statement.registerOutParameter(6, java.sql.Types.INTEGER);

			statement.execute();

			int direccionId = statement.getInt(6);

			direccion.setId(direccionId);

			conn.close();
			return true;

		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (SQLException r) {
			System.out.println(String.format("Error SQL: %s", r.toString()));
		}
		return false;
	}

}