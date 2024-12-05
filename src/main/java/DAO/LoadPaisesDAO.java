package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;

/**
 * Carga datos guardados en la base
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/18
 * @since 2024/11/18 
 * */
public class LoadPaisesDAO {
    
	/**
	 * Carga paises guardados en la base
	 * @author agblandin@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/18
	 * @since 2024/11/18
	 * */
    public String loadPaises() {
        StringBuilder result = new StringBuilder("{\"paises\":[");

        String sql = "SELECT Nombre,Codigo FROM Paises;";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = new DataBaseConnection("usuarioDeAngel", "contraseñaDeAngel").getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            ResultSet resultSet = statement.executeQuery();
            
            boolean first = true;  

            while (resultSet.next()) {
            	
                String pais = resultSet.getString("Nombre");
                String codigo = resultSet.getString("Codigo");
                
                if (!first) {
                    result.append(",");
                }

                result.append(String.format("\"Nombre\":\"%s\"", pais));
                result.append(String.format("\"Codigo\":\"%s\"", codigo));
                first = false;  
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
