package enfermero_rh_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
import services.Persona;


/**
 * Obtiene los tipos de sangre guardados en la base
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/30
 * @since 2024/11/30
 * @param value nombre de la tabla de la cual se va a extraer la data
 * @return retorna un json con el nombre y el codigo de cada tipo de sangre
 */
public class LoadDataDAO {

	/**
	 * ejecuta una consulta para obtner  los tipos de sangre guardados en la base
	 * 
	 * @author agblandin@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/30
	 * @since 2024/11/30
	 * @param value nombre de la tabla de la cual se va a extraer la data
	 * @return retorna un json con el nombre y el codigo de cada tipo de sangre
	 */
	public String getBloodType(String value) {

		StringBuilder result = new StringBuilder("{\"data\":[");

		String sql =String.format( "SELECT * FROM %s", value);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			ResultSet resultSet = statement.executeQuery();

			boolean first = true;
			
			while (resultSet.next()) {

				String pais = resultSet.getString("Nombre");
				String codigo = resultSet.getString("Codigo");

				System.out.println(pais);


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
			System.out.println(String.format("Error SQL: %s", r.toString()));
		}

		return result.toString();
	}

}
