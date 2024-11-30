package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;

/**
 * retorna la data una vez que se refresque la pantalla
 * @author cdcruzr@unah.hn
 * @version 0.2.0
 * @date 2024/11/15
 * @since 2024/11/29
 * */
public class DataBaseConnection {
	
	// Información de conexión a la base de datos
	private static String dburl = "jdbc:sqlserver://localhost:1433;databaseName=HospitalDatabase;encrypt=true;trustServerCertificate=true";
    private String dbUser;
    private String dbPassword;
    
    public DataBaseConnection(String dbUser, String dbPassword) {
    	
    	this.dbUser = dbUser;
    	this.dbPassword = dbPassword;
    }
    
	/**
	* Establece una conexion a la base de datos
	* @author cdcruzr@unah.hn, jesus.zepeda@unah.hn
	* @version 0.2.0
	* @date 2024/11/15
	* @since 2024/11/29
	* */
    public Connection getConnection() throws ClassNotFoundException, SQLException {
       Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
       DriverManager.registerDriver(new SQLServerDriver());
       return DriverManager.getConnection(dburl, this.dbUser, this.dbPassword);
   }
}