package enfermero_rh_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
import services.EmpleadoData;
import services.Horario;

/**
 * Guarda los horarios de los empleados en la base
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/18
 * @since 2024/11/18
 */
public class HorarioDAO {

	/**
	 * Crea una consulta y ejecuta una nueva inserccion de un nuevo horario
	 * 
	 * @param empleado Es un objeto que contiene los datos del empleado
	 * @param horario  Es una cadena que contiene el horario del empleado
	 * @return returna un true si se ejecuta con exito
	 */
	public boolean create(EmpleadoData empleado, String horario) {

		String sql = "INSERT INTO Horarios VALUES (?, ?, ?, ?, ?)";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			statement.setString(1, "Turno matutin");
			statement.setInt(2, empleado.getId());
			statement.setInt(3, Integer.parseInt(horario));
			statement.setString(4, "L-V");
			statement.setInt(5, 1);

			int rowsAffected = statement.executeUpdate();

			if (rowsAffected > 0) {
				ResultSet generatedKeys = statement.getGeneratedKeys();
				if (generatedKeys.next()) {
					int horarioId = generatedKeys.getInt(1);
					Horario.setId(horarioId);
					System.out.println("ID de horario generado: " + horarioId);
				}
			}

			conn.close();
			return true;
		} catch (ClassNotFoundException e) {
			System.out.println("Error al cargar el controlador JDBC: " + e);
		} catch (SQLException r) {
			System.out.println(String.format("Error SQL: %s  fallo horario", r.toString()));
		}
		return false;
	}

}
