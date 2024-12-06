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
	 * Método para obtener la cantidad de órdenes de recetas registradas y que no están atendidas.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/27
	 * @return La cantidad de órdenes de recetas que hay en la base de datos (sin atender).
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException	Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	private static int getRecipeOrdersCount() throws ClassNotFoundException, SQLException {
		
		String query = "SELECT COUNT(*) FROM ConsultasMedicas";
		
		Connection connection = new DataBaseConnection("medico","medico123").getConnection();
		
		PreparedStatement statement = connection.prepareStatement(query);
		
		ResultSet resultSet = statement.executeQuery();
		
		int recipeOrdersCount = 0;
		
		if (resultSet.next()) {
			recipeOrdersCount = resultSet.getInt(1);
		}
		
		connection.close();
		
		return recipeOrdersCount;
	}
	
	/**
	 * Método que obtiene todas las órdenes de recetas registradas de la base de datos y que no están atendidas.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/11/27
	 * @date 2024/11/29
	 * @param start Indica el índice de registro a partir del cuál se empezará a seleccionar.
	 * @param length Indica la cantidad de registros que se espera seleccionar.
	 * @param searchValue Indica el valor a ser buscado en las columnas de cada registro para especificar éstos aún más.
	 * @param orderColumnIndex Indica el índice de la columna por la cual se aplicará la instrucción ORDER BY en la consulta a realizar.
	 * @param orderDirection Indica la dirección de ordenado.
	 * @return Un mapa convertible en Json con los datos extraídos de la base de datos y con información adicional necesaria para dar respuesta al Frontend.
	 * @throws ClassNotFoundException Excepción que se produce cuando no se encuentra una clase.
	 * @throws SQLException Excepción que se produce cuando ocurre un error en la base de datos.
	 */
	public static Map<String, Object> getConsultas(int start, int length, String searchValue, int orderColumnIndex, String orderDirection) throws ClassNotFoundException, SQLException {
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
	    List<String> recipeOrders = new ArrayList<>();
	    Map<String, String> recipe;

	    while (resultSet.next()) {
	        recipe = new HashMap<>();
	        recipe.put("id", resultSet.getString(1));      // Asignar el primer campo de la consulta
	        recipe.put("paciente", String.format("%s %s", resultSet.getString(2), resultSet.getString(3))); // Asignar el segundo campo
	        recipe.put("fecha", resultSet.getString(4));  // Asignar el cuarto campo
	        
	        // Otros campos según tus necesidades, en este caso "accion" y "generarReceta"
	        recipe.put("Accion", resultSet.getString(1));
	        recipe.put("Generar receta", resultSet.getString(1));

	        recipeOrders.add(new Gson().toJson(recipe));  // Convertir el mapa a JSON
	    }

	    response.put("recordsTotal", String.format("%s", getRecipeOrdersCount()));  // Total de registros
	    response.put("recordsFiltered", String.format("%s", recipeOrders.size()));  // Registros obtenidos
	    response.put("data", recipeOrders);  // Agregar los datos de las recetas

	    return response;
	}

}
