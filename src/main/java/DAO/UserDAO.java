package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
	/**
	 * retorna la data una vez que se refresque la pantalla
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @date 2024/08/15
	 * @since 2024/08/15
	 * */
public class UserDAO {
	private String username;
	private String password;
	
	public UserDAO(String username, String password) {
		this.username = username; 
		this.password = password;
		
	}
	/**
	 * verifica si el usuario forma parte de la base de datos con su correo y password
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/16
	 * @since 2024/11/16
	 * */
	public boolean isUser() {
    	boolean isValid = false;
            String sql = "SELECT * FROM Usuarios WHERE Correo = ? AND contrasena = ?";
            try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = new DataBaseConnection("aless","aless2002CD").getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);  // Asignamos el valor del username
            statement.setString(2, password);  // Asignamos el valor del password

            ResultSet resultSet = statement.executeQuery();

            // Si el resultado contiene una fila, significa que las credenciales son válidas
            if (resultSet.next()) {
                isValid = true;
            }
            System.out.println(isValid);
            conn.close();
        } catch (ClassNotFoundException e) {
        	System.out.println(e);
        }catch(SQLException r) {
        	System.out.println(String.format("Error SQL: %s", r.toString()));
        }
        return isValid;
    }
	/**
	 * para extraer el id del usuario
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/16
	 * @since 2024/11/16
	 * */
    public int idUser() throws ClassNotFoundException, SQLException {
        String sql = "SELECT id FROM usuarios WHERE Correo = ? AND Contrasena= ?";
       
        Connection conn = new DataBaseConnection("aless","aless2002CD").getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, username);  // Asignamos el valor del username
        statement.setString(2, password);  // Asignamos el valor del password
        

        ResultSet resultSet = statement.executeQuery();
        return resultSet.getInt("id");
    }
}
