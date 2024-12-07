package api;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

import DataBase.DataBaseConnection;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;


/**
 * Servlet que guarda los datos del formulario de registro de un paciente en la base de datos
 * @author pnvarela@unah.hn
 * @version 0.1.0
 * @date 2024/12/04
 * @since 2024/12/02
 */
@WebServlet("/api/setPaciente")
public class SetPacienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SetPacienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * Método que lee el contenido de la solicitud post para manejar los datos enviados en formato JSON
	 * que provienen del frontend 
	 * @author pnvarela@unah.hn
	 * @version 0.1.0
	 * @date 2024/12/03
	 * @since 2024/12/02 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
        StringBuilder jsonData = new StringBuilder();
        String line;
        
        // Leemos el contenido línea por línea 
        while ((line = reader.readLine()) != null) {
            jsonData.append(line);
        }

        // Parseamos JSON a un objeto java usando GSON (string, object)
        Gson gson = new Gson();
        Map<String, Object> dataMap = gson.fromJson(jsonData.toString(), Map.class); //especificamos la clase donde se van a mapear los datos del json

        try {
        	int DireccionId = saveToDirecciones(dataMap); 
        	int PersonaId = saveToPersonas(dataMap, DireccionId);
            saveToTelefonos(dataMap, PersonaId);
            saveToPacientes(dataMap, PersonaId); 
            
            response.setStatus(200);  // solicitud exitosa
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500); // error interno en el servidor
        }
	}


	/**
	 * Método que guarda los respectivos datos del form en la tabla Direcciones
	 * que provienen del frontend 
	 * @author pnvarela@unah.hn
	 * @version 0.1.0
	 * @date 2024/12/03
	 * @since 2024/12/02 
	 */
	private int saveToDirecciones(Map<String, Object> dataMap) throws Exception {
		Connection connection = new DataBaseConnection("admin","admin1").getConnection();
		connection.setAutoCommit(false); // Desactiva el autocommit
		
		String query = "INSERT INTO Direcciones (PaisId, DepartamentoId, CiudadId, ColoniaId, Referencia) VALUES (?, ?, ?, ?, ?);";
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
	    	statement.setInt(1, (int) dataMap.get("pais"));
	    	statement.setInt(2, (int) dataMap.get("depto"));
	    	statement.setInt(3, (int) dataMap.get("ciudad"));
	    	statement.setInt(4, (int) dataMap.get("colonia"));
	    	statement.setString(5, (String) dataMap.get("referencia"));
        	statement.executeUpdate();
        	
        	// Obtener el ID de la dirección insertada
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Retorna el ID de la dirección
            }
            
            connection.commit(); // Confirma los cambios si todo está bien
        } catch (Exception e) {
            if (connection != null) {
            	connection.rollback(); // Reversión en caso de error
            }
            e.printStackTrace();
        } finally {
            if (connection != null) {
            	connection.close();
            }
        }
        
        return -1; //en caso de error
        
	}
	
	/**
	 * Método que guarda los respectivos datos del form en la tabla Personas
	 * que provienen del frontend 
	 * @author pnvarela@unah.hn
	 * @version 0.1.0
	 * @date 2024/12/03
	 * @since 2024/12/02 
	 */
	private int saveToPersonas(Map<String, Object> dataMap, int DireccionId) throws Exception {
		Connection connection = new DataBaseConnection("admin","admin1").getConnection();
		connection.setAutoCommit(false); // Desactiva el autocommit 
		
		String query = "INSERT INTO Personas (DNI, RTN, N1, N2, AP1, AP2, Sexo, FechaNacimiento, DireccionId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
		try (PreparedStatement statement = connection.prepareStatement(query)){
	    	statement.setString(1, (String) dataMap.get("DNI"));
        	statement.setString(2, (String) dataMap.get("RTN"));
        	statement.setString(3, (String) dataMap.get("primerNombre"));
        	statement.setString(4, (String) dataMap.get("segundoNombre"));
        	statement.setString(5, (String) dataMap.get("primerApellido"));
        	statement.setString(6, (String) dataMap.get("segundoApellido"));
        	statement.setString(7, (String) dataMap.get("sexo"));
        	statement.setString(8, (String) dataMap.get("fecha"));
	    	statement.setInt(9, DireccionId);
        	statement.executeUpdate();
        	
        	// Obtener el ID de la persona insertada
        	ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Retorna el ID de la persona
            }
            
            connection.commit(); // Confirma los cambios si todo está bien
        } catch (Exception e) {
            if (connection != null) {
            	connection.rollback(); // Reversión en caso de error
            }
            e.printStackTrace();
        } finally {
            if (connection != null) {
            	connection.close();
            }
        }
        
        return -1;
		
		
	}
	
	/**
	 * Método que guarda los respectivos datos del form en la tabla Telefonos
	 * que provienen del frontend 
	 * @author pnvarela@unah.hn
	 * @version 0.1.0
	 * @date 2024/12/03
	 * @since 2024/12/02 
	 */
	private void saveToTelefonos(Map<String, Object> dataMap, int PersonaId) throws Exception {
		Connection connection = new DataBaseConnection("admin","admin1").getConnection();
		
		String query = "INSERT INTO Telefonos (Num, PersonaId, Activo) VALUES (?, ?, ?)";
		boolean activo = true;
		
		try (PreparedStatement statement = connection.prepareStatement(query)){
	    	statement.setString(1, (String) dataMap.get("telefono"));
	    	statement.setInt(2, PersonaId);
	    	statement.setBoolean(3, activo);
        	statement.executeUpdate();
        }
		
	}
	
	/**
	 * Método que guarda los respectivos datos del form en la tabla Pacientes
	 * que provienen del frontend 
	 * @author pnvarela@unah.hn
	 * @version 0.1.0
	 * @date 2024/12/03
	 * @since 2024/12/02 
	 */
	private void saveToPacientes(Map<String, Object> dataMap, int PersonaId) throws Exception {
		Connection connection = new DataBaseConnection("admin","admin1").getConnection();
		
		String query = "INSERT INTO Pacientes (PersonaId, NumTelEmergencia) VALUES (?, ?)";
		boolean activo = true;
		
		try (PreparedStatement statement = connection.prepareStatement(query)){
	    	statement.setInt(1, PersonaId);
	    	statement.setString(5, (String) dataMap.get("NumTelEmergencia"));
        
        }
		
	}
	
}
