package enfermero_rh_DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
import services.Direccion;
import services.Persona;

/**
 * Crea nuevas personas con la data recibida
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/27
 * @since 2024/11/27
 */
public class PersonaDAO {

	/**
	 * Crea una consulta y ejecuta una inserccion de una nueva persona
	 * 
	 * @param persona   Es un objeto que contiene los atributos que se van a guardar
	 * @param direccion Contiene la direccion asociada ala persona
	 */
	public boolean create(Persona persona, Direccion direccion) {

		String sql = "{CALL InsertarPersona(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			CallableStatement statement = conn.prepareCall(sql);

			statement.setString(1, persona.getDni());

			if (persona.getRtn() == null || persona.getRtn().trim().isEmpty()) {
				statement.setNull(2, java.sql.Types.VARCHAR);
			} else {
				statement.setString(2, persona.getRtn());
			}
			statement.setString(3, persona.getNombre1());
			statement.setString(4, persona.getNombre2());
			statement.setString(5, persona.getApellido1());
			statement.setString(6, persona.getApellido2());
			statement.setString(7, persona.getSexoPersona());
			statement.setString(8, persona.getFechaNacimiento());
			statement.setInt(9, direccion.getId());

			statement.registerOutParameter(10, java.sql.Types.INTEGER);

			statement.executeUpdate();

			int personaId = statement.getInt(10);
			persona.setId(personaId);

			conn.close();
			return true;

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("Error al registrar persona: " + e);
		}

		return false;
	}
}
