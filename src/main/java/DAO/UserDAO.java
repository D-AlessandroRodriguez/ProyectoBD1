package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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
            String sql = "EXEC selectUsuario @correo = ?, @contra = ?";
            try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);  // Asignamos el valor del username
            statement.setString(2, password);  // Asignamos el valor del password

            ResultSet resultSet = statement.executeQuery();

            // Si el resultado contiene una fila, significa que las credenciales son válidas
            if (resultSet.next()) {
                isValid = true;
            }
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
    public Map<String, Object> userInfo() throws ClassNotFoundException, SQLException {
        String sql = "EXEC selectUsuario @correo = ?, @contra = ?";
        Map<String, Object> result = new HashMap<>();
        
        Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        
        statement.setString(1, username);  // Asignamos el valor del username
        statement.setString(2, password);  // Asignamos el valor del password
        

        ResultSet resultSet = statement.executeQuery();
        if(resultSet.next()) {
        	result.put("nombreUsuario", resultSet.getString(1));
        	result.put("rol", resultSet.getString(2));
        	result.put("email", resultSet.getString(3));
        	result.put("medicoId", resultSet.getInt(4));
        	result.put("nombreMedico", resultSet.getString(5));	
        	result.put("cargo", resultSet.getString(6));
        }
        return result;
    }
}