package enfermero_rh_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
import services.EmpleadoData;

/**
 * Guarda una relacion entre empleados y horarios en la base
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/27
 * @since 2024/11/27
 */
public class TitulacionesEmpleadoDAO {


	/**
	 * Crea una consulta y ejecuta una nueva inserccion de una direccion
	 * 
	 * @param empleado Es un objeto que contiene contiene los valores del empleado
	 * @param String Es un arreglo que contiene contiene los titulos de un empleado
	 *  @return returna un true si se ejecuta con exito
	 */
	public boolean create(EmpleadoData empleado, String titulo) {

		String sql = "INSERT INTO EmpleadoTitulacion VALUES (?,?)";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			
			statement.setInt(1, empleado.getId());
			statement.setInt(2, Integer.parseInt(titulo));
			statement.executeUpdate();

			conn.close();
			return true;
		} catch (ClassNotFoundException e) {
			System.out.println("Error al cargar el controlador JDBC: " + e);
		} catch (SQLException r) {
			System.out.println(String.format("Error SQL: %s  fallo Realcaion M A M ", r.toString()));
		}
		return false;
	}

}
