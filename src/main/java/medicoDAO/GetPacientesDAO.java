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

public class GetPacientesDAO {
	/**
	 * metodo para obtener los id y nombres de la base de datos
	 * 
	 * @author cdcruz@unah.hn
	 * @version 0.0.1
	 * @since 2024/12/4
	 * @date 2024/12/4
	 * 
	 * @return retorna un JSON donde va la informacion de los pacientes el select paciente
	 */
	public String getPacientes() throws ClassNotFoundException, SQLException{
		Map<String,Object> producto;
		
		String queryProductos = "SELECT per.Id, per.N1, per.AP1 FROM Pacientes pac INNER JOIN Personas per ON pac.PersonaId = per.Id ";
		Connection connection = new DataBaseConnection("medico","medico123").getConnection();
		
		PreparedStatement ps = connection.prepareStatement(queryProductos);
		ResultSet rs = ps.executeQuery();
		
		List<String> listProductos = new ArrayList<>();
		while(rs.next()) {
			producto = new HashMap<>();
			producto.put("id", rs.getString(1));
			producto.put("n1", rs.getString(2));
			producto.put("a1", rs.getString(3));
			
			listProductos.add(new Gson().toJson(producto));
		}
		return new Gson().toJson(listProductos);
	}
}
