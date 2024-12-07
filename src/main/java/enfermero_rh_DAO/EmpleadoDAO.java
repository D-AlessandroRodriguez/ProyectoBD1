package enfermero_rh_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

import DataBase.DataBaseConnection;
import services.EmpleadoData;

/**
 * Guarda un nuevo empleado en la base
 * 
 * @author agblandin@unah.hn
 * @version 0.1.1
 * @date 2024/12/01
 * @since 2024/12/01
 */
public class EmpleadoDAO {
	
	/**
	 * Crea una consulta y ejecuta una nueva inserccion de un nuevo empleado
	 * 
	 * @param empleado Es un objeto que contiene contiene los valores a guaradar de un nuevo empleado
	 * @param email es una cadena con el email del empleado a guardar
	 *  @return returna un true si se ejecuta con exito
	 */

    public boolean create(EmpleadoData empleado,String email) {
       

        String sql = "INSERT INTO Empleados VALUES (?, ?, ?,?,?,?,?)";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DataBaseConnection.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

            statement.setInt(1, empleado.getPersona().getId());
            statement.setBigDecimal(2, empleado.getSalario());
            statement.setInt(3, empleado.getActivo());
            statement.setInt(4, empleado.getDeptoId());
            statement.setInt(5, empleado.getCargoId());
            statement.setString(6, empleado.getFechaI());
            statement.setString(7, email);
           
            

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int direccionId = generatedKeys.getInt(1);
                    empleado.setId(direccionId);
                    
                }
            }

            conn.close();
            return true;
        } catch (ClassNotFoundException e) {
            
        } catch (SQLException r) {
            System.out.println(String.format("Error SQL: %s  fallo empleado", r.toString()));
        }
        return false;
    }
}
