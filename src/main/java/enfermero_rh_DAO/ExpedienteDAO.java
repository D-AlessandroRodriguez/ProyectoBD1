package enfermero_rh_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
import services.Direccion;
import services.Paciente;
import services.Persona;

/**
 * Crea y gurda nuevos expedientes
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/30
 * @since 2024/11/30
 * @param
 */
public class ExpedienteDAO {

	private AccessDAO access = new AccessDAO();

	/**
	 * Crea una consulta y ejecuta una nueva inserccion de un nuevo expediente
	 * 
	 * @param paciente Es un objeto que contiene contiene los valores a guaradar de un nuevo paciente 
	 * @param typeBlood es una cadena que especifica eltipo de sangre del paciente 
	 * @param status especifica el esta salud del paciente
	 *  @return returna un true si se ejecuta con exito
	 */
	public boolean createExpediente(Paciente paciente, String typeBlood, String status) {

		String sql = "INSERT INTO Expedientes VALUES(?,?,?)";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, paciente.getId());
			statement.setString(2, typeBlood);
			statement.setString(3, status);

			statement.execute();

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
