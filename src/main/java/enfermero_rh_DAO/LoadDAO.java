package enfermero_rh_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
import services.ConsultSQL;

/**
 * Carga datos guardados en la base
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/18
 * @since 2024/11/18
 */
public class LoadDAO {

	/**
	 * Carga paises guardados en la base
	 * 
	 * @author agblandin@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/18
	 * @since 2024/11/18
	 */
	public String loadPaises(String nombre, String codigos) {

		String sql = ConsultSQL.getConsult(nombre, codigos);

		System.out.println(nombre);
		StringBuilder result = new StringBuilder();
		if (nombre.equals("Titulaciones")) {
			result.append("{\"Titulaciones\":[");
		} else {
			result.append("{\"data\":[");
		}

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);

			ResultSet resultSet = statement.executeQuery();

			boolean first = true;

			while (resultSet.next()) {
				String codigo = new String();

				String pais = resultSet.getString("Nombre");

				// si es un departemaneto o cargo pedimos el codifo y no el id
				if (nombre.equals("cargos") || nombre.equals("deptosh")) {
					codigo = resultSet.getString("Codigo");
				} else if (nombre.equals("horario")) {

					return ConsultSQL.getHorarios(resultSet);
				}

				else {

					codigo = resultSet.getString("Id");

				}

				if (!first) {
					result.append(",");
				}

				result.append("{");
				result.append(String.format("\"Nombre\":\"%s\",", pais));
				result.append(String.format("\"Codigo\":\"%s\"", codigo));
				first = false;
				result.append("}");
			}

			result.append("]}");
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (SQLException r) {
			System.out.println(String.format("Error SQL: %s %s", r.toString(), nombre));
		}

		return result.toString();
	}
}
