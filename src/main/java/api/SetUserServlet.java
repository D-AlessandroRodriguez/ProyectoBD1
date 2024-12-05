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
import java.util.HashMap;
import java.util.Map;


/**
 * Servlet que guarda los datos del formulario de creación de un usuario en la base de datos
 * @author pnvarela@unah.hn
 * @version 0.1.0
 * @date 2024/12/04
 * @since 2024/12/02
 */
@WebServlet("/api/setUser")
public class SetUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SetUserServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        	int UsuarioId = saveToUsuarios(dataMap); 
        	saveToUsuariosRoles(dataMap, UsuarioId);
            response.setStatus(200);  // solicitud exitosa
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500); // error interno en el servidor
        }
	}
	
	
	/**
	 * Método que guarda los respectivos datos del form en la tabla Usuarios
	 * que provienen del frontend 
	 * @author pnvarela@unah.hn
	 * @version 0.1.0
	 * @date 2024/12/03
	 * @since 2024/12/02 
	 */
	private int saveToUsuarios(Map<String, Object> dataMap) throws Exception {
		Connection connection = new DataBaseConnection("admin","admin1").getConnection();
		
		String query = "INSERT INTO Usuarios (PersonaId, EmpleadoId, Correo, Contrasena, Activo) VALUES (?, ?, ?, ?, ?)";
		boolean activo = true;
		
		try (PreparedStatement statement = connection.prepareStatement(query)){
	    	statement.setInt(1, (int) dataMap.get("idPersonaIngresada"));
	    	statement.setInt(2, (int) dataMap.get("idEmpleadoIngresado"));
	    	statement.setString(3, (String) dataMap.get("CorreoIngresado"));
	    	statement.setString(4, (String) dataMap.get("pwd"));
	    	statement.setBoolean(5, activo);
        	statement.executeUpdate();
        
        	// Obtener el ID del user insertado
        	ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Retorna el ID del user
            }
        }
        
        return -1;
		
	}
	
	/**
	 * Método que guarda los respectivos datos del form en la tabla UsuariosRoles
	 * que provienen del frontend 
	 * @author pnvarela@unah.hn
	 * @version 0.1.0
	 * @date 2024/12/03
	 * @since 2024/12/02 
	 */
	private void saveToUsuariosRoles(Map<String, Object> dataMap, int UsuarioId) throws Exception {
		Connection connection = new DataBaseConnection("admin","admin1").getConnection();
		
		/*
		Si en cambio el valor de ROL en el select no fuera numérico sino más bien un código como AD, ED, o el nombre como
		tal (ej. Administrador, Editor, etc), entonces primero debo hacer un select para obtener el id asociado a ese nombre
		y luego insertarlo en la tabla UsuariosRoles:
		 
		String getRolIdFromTable = "SELECT Id FROM Roles WHERE Nombre = ? ";
		PreparedStatement statementRol = connection.prepareStatement(getRolIdFromTable);
		statementRol.setString(1, (String) dataMap.get("rol")); // guardamos el valor del id del rol, proveniente del formulario 
		ResultSet rsRol = statementRol.executeQuery();
		if(rsRol.next()){
			int rolId = rsRol.getInt("Id");
			// string query, try
		}		
		*/
		String query = "INSERT INTO UsuariosRoles (UsuarioId, RolId) VALUES (?, ?)";
		
		try (PreparedStatement statement = connection.prepareStatement(query)){
			statement.setInt(1, UsuarioId);
	    	statement.setInt(2, (int) dataMap.get("rol"));
			statement.executeUpdate();
        }
		
	}

}
