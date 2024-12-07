package enfermero_rh_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
import services.Direccion;
import services.Paciente;
import services.Persona;

/**
 * Guarda nuevos pacientes
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/30
 * @since 2024/11/30
 */
public class PacienteDAO {

	private AccessDAO get = new AccessDAO();

	/**
	 * Crea una consulta y ejecuta una nueva inserccion de un nuevo paciente
	 * 
	 * @param paciente Es un objeto que contiene los valores a guaradar del paciente
	 *  @return returna un true si se ejecuta con exito
	 */
	public boolean createPaciente(Paciente paciente) {

		String sql = "INSERT INTO Pacientes VALUES(?,?)";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			statement.setInt(1, paciente.getPerson().getId());
			statement.setString(2, paciente.getNumberPhone());

			int rowsAffected = statement.executeUpdate();
			if (rowsAffected > 0) {

				ResultSet generatedKeys = statement.getGeneratedKeys();
				if (generatedKeys.next()) {
					int pacienteId = generatedKeys.getInt(1);
					paciente.setId(pacienteId);
					System.out.println("ID de paciente generado: " + pacienteId);
				}
			}

			conn.close();
			return true;

		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (SQLException r) {
			System.out.println(String.format("Error SQL: %s  fallo paciente", r.toString()));
		}

		return false;
	}

}
