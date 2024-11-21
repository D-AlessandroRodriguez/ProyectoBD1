package programLibraries;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLDatabaseConnection {

    // Connect to your database.
    // Replace server name, username, and password with your credentials
    public String getUser(String email) {
        String connectionUrl =
                "jdbc:sqlserver://localhost:1433;databaseName:HospitalDatabase;"
               
                + "user=sa;"
                + "password=1234;"
                + "encrypt=true;"
                + "trustServerCertificate=false;"
                + "loginTimeout=30;";

        ResultSet resultSet = null;

        try (Connection connection = DriverManager.getConnection(connectionUrl);
                Statement statement = connection.createStatement();) {

             //Create and execute a SELECT SQL statement.
           String selectSql = "SELECT *FROM Personas";
            resultSet = statement.executeQuery(selectSql);
            System.out.println(resultSet.getString(1));
            
            ///Print results from select statement
            //while (resultSet.next()) {
             //   System.out.println(resultSet.getString(2) + " " + resultSet.getString(3));
           // }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}