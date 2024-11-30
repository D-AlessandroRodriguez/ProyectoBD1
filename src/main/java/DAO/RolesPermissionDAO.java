package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DataBase.DataBaseConnection;
/**
 * retorna la data una vez que se refresque la pantalla
 * @author cdcruzr@unah.hn
 * @version 0.1.0
 * @date 2024/08/15
 * @since 2024/08/15
 * */
public class RolesPermissionDAO {
	/**
	 * metodo para obtener los roles y permisos del usuario
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/15
	 * @since 2024/11/15
	 * */
	 public List<String> getPermissionsForRole(int roleId) throws ClassNotFoundException {
	        String query = "\r\n"
	        		+ "SELECT p.id, p.Nombre, r.Id, r.Nombre\r\n"
	        		+ "FROM Roles r\r\n"
	        		+ "INNER JOIN RolesPermisos rp ON r.id = rp.RolId\r\n"
	        		+ "INNER JOIN Permisos p ON rp.PermisoId = p.id\r\n"
	        		+ "WHERE r.id = ?";
	        
	        List<String> rolesPermisos = new ArrayList<>();
	        try {
	        	Connection con = new DataBaseConnection("", "").getConnection();
	            PreparedStatement ps = con.prepareStatement(query);
	            ps.setInt(1, roleId);
	            
	            try (ResultSet rs = ps.executeQuery()) {
	                while (rs.next()) {
	                    rolesPermisos.add(rs.getString("id"));
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return rolesPermisos;
	    }
	  /**
	  * metodo de prueba para obtener los permisos del usuario
	  * @author cdcruzr@unah.hn
	  * @version 0.1.0
	  * @date 2024/11/15
	  * @since 2024/11/15
	  * */
	public String Roles() {
		String query = "";
		try {
			Connection con = new DataBaseConnection("", "").getConnection();
			PreparedStatement ps = con.prepareStatement(query);	
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
				
				
		return null;
	}
}
