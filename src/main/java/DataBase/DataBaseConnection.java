package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;
	/**
	 * retorna la data una vez que se refresque la pantalla
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @date 2024/11/15
	 * @since 2024/11/15
	 * */

public class DataBaseConnection {
	  // Información de conexión a la base de datos
	private static String dburl = "jdbc:sqlserver://localhost:1433;databaseName=HospitalDatabase;encrypt=true;trustServerCertificate=true";
    private static String dbUser = "farmaceutico";  // Usuario de la base de datos
    private static String dbPassword = "jesus123";  // Contraseña de la base de datos
    
	/**
	* Establece una conexion a la base de datos
	* @author cdcruzr@unah.hn
	* @version 0.1.0
	* @date 2024/11/15
	* @since 2024/11/15
	* */
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       DriverManager.registerDriver(new SQLServerDriver());
       return DriverManager.getConnection(dburl, dbUser, dbPassword);
   }
}
