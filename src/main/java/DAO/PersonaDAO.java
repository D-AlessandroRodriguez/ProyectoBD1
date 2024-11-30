package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;
import programLibraries.Persona;

/**
 * Guarda nuevas personas en la base
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/18
 * @since 2024/11/18
 * */
public class PersonaDAO{
	

	/**
	 * Guarda nuevos registros de personas
	 * @author agblandin@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/18
	 * @since 2024/11/18
	 * @param  
	 * */
	public boolean  create(Persona persona) {
		
		
		String sql = "INSERT INTO Personas Values(?,?,?,?,?,?,?,?)";
        try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DataBaseConnection.getConnection();
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, persona.getDni()); 
        statement.setString(2, persona.getRtn()); 
        statement.setString(3, persona.getNombre1());  
        statement.setString(4, persona.getNombre2());  
        statement.setString(5, persona.getApellido1()); 
        statement.setString(6, persona.getApellido2());  
        statement.setString(7, persona.getFechaNacimiento());  
        statement.setString(8, persona.getSexoPersona()); 

       statement.execute();
		
		
        conn.close();
        return true;
		
	
	} catch (ClassNotFoundException e) {
    	System.out.println(e);
    }catch(SQLException r) {
    	System.out.println(String.format("Error SQL: %s", r.toString()));
    }
	
        return false;
	}
}
