package enfermero_rh_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;

public class AccessDAO {

	/**
	 * Crea una consulta y busca in Id en una tabla
	 * 
	 * @param table  Es nombre de la tabla donde se realizara la busqueda
	 * @param codigo es una cadena que contiene el codigo que se usa para filtrar en
	 *               la tabla
	 * @return Retorna el una cadena con el Id si este existe de lo contrario un
	 *         null
	 */
	public static Integer getId(String table, String codigo) {
		String sql = String.format("SELECT Id FROM %s WHERE Codigo = ?", table);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, codigo);
			ResultSet result = statement.executeQuery();

			if (result.next()) {
				Integer id = result.getInt("Id");
				conn.close();
				return id;
			}
			conn.close();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Crea una consulta y busca in Id en una tabla
	 * 
	 * @param table  Es nombre de la tabla donde se realizara la busqueda
	 * @param codigo es una valor entero que se usa para filtrar en la tabla
	 * @return Retorna el Id si este existe de lo contrario un null
	 */
	public static Integer getId(String table, int codigo) {
		String sql = String.format("SELECT Id FROM %s WHERE Codigo = ?", table);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, codigo);
			ResultSet result = statement.executeQuery();

			if (result.next()) {
				Integer id = result.getInt("Id");
				conn.close();
				return id;
			}
			conn.close();
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(e);
		}
		return null;
	}

	/**
	 * Crea una consulta y verifica si un Id existe en la tabla personas
	 * 
	 * @param table Es nombre de la tabla donde se realizara la busqueda
	 * @param value es una cadena con el valor que se quiere buscar
	 * @param col   es el nombre de la columna donde va a buscar
	 * @return Retorna el un true si este existe de lo contrario un false
	 */
	public static boolean isValueExist(String value, String col) {
		String sql = String.format("SELECT COUNT(*) FROM Personas WHERE %s = ?", col);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, value);
			ResultSet rs = statement.executeQuery();

			if (rs.next()) {
				int count = rs.getInt(1);
				if (count > 0) {
					return true;
				}
			}

			rs.close();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e);
		}
		return false;
	}

	/**
	 * Crea una consulta y verifica si un Id existe en la tabla personas
	 * 
	 * @param table Es nombre de la tabla donde se realizara la busqueda
	 * @param value es un valor entero que se quiere buscar en la tabla
	 * @param col   es el nombre de la columna donde va a buscar
	 * @return Retorna el un true si este existe de lo contrario un false
	 */
	public static boolean isValueExist(int value, String col) {
		String sql = String.format("SELECT COUNT(*) FROM Personas WHERE %s = ?", col);
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DataBaseConnection.getConnection();
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setInt(1, value);
			ResultSet rs = statement.executeQuery();

			if (rs.next()) {
				int count = rs.getInt(1);
				if (count > 0) {
					return true;
				}
			}

			rs.close();
			conn.close();
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println(e);
		}
		return false;
	}

}
