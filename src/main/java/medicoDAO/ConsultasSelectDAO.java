package medicoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import DataBase.DataBaseConnection;

public class ConsultasSelectDAO {	
	/**
	 * Método que obtiene todas las órdenes de recetas registradas de la base de datos y que no están atendidas.
	 * @author jesus.zepeda@unah.hn, cdcruz@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/29
	 */
	public static Map<String, Object> getConsultas() throws ClassNotFoundException, SQLException {
	    // Llamada al procedimiento almacenado sin parámetros
		   String query = """
		            SELECT con.Id AS consultaId, pers.N1 AS nombrePaciente, pers.AP1 AS apellidoPaciente, con.Fecha
		            FROM ConsultasMedicas con
		            INNER JOIN Expedientes expe ON con.ExpedienteId = expe.Id
		            INNER JOIN Pacientes pac ON expe.PacienteId = pac.Id
		            INNER JOIN Personas pers ON pac.PersonaId = pers.Id
		        """;

	    Connection connection = new DataBaseConnection("medico", "medico123").getConnection();
	    
	    // Preparar la consulta para ejecutar el procedimiento almacenado
	    PreparedStatement statement = connection.prepareStatement(query);
	    
	    // Ejecutar la consulta
	    ResultSet resultSet = statement.executeQuery();

	    Map<String, Object> response = new HashMap<>();
	    List<String> consultas = new ArrayList<>();
	    Map<String, String> consultasParam;

	    while (resultSet.next()) {
	        consultasParam = new HashMap<>();
	        consultasParam.put("fecha", resultSet.getString(4));
	        consultasParam.put("paciente", String.format("%s %s", resultSet.getString(2), resultSet.getString(3))); // Asignar el segundo campo
	        consultasParam.put("id", resultSet.getString(1));
	        
	        consultas.add(new Gson().toJson(consultasParam));
	    }
	    response.put("data", consultas);
	    return response;
	}

}
