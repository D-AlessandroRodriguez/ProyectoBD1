package medicoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;

public class RegistrarConsultaDAO {
	/**
	 * hace el insert de la consulta
	 * @author cdcruzr@unah.edu.hn
	 * @version 0.0.1
	 * @since 2024/12/4
	 * @date  2024/12/4
	 * */
	public String registrarConsulta(String paciente, String fecha, String hora, String costo, String idMedico) throws ClassNotFoundException, SQLException {
		String idExpediente = encontrarExpediente(paciente);
		String query = null;
		
		Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, fecha);
		ps.setString(2, hora);
		ps.setString(3, idMedico);
		ps.setString(4, idExpediente);		
		ps.setString(5, costo);
		
		int rs = ps.executeUpdate();
		
		return "filas afectadas"+ rs;
	}
	/**
	 * encuentra el expediente mediante join en un proceso almacenado
	 * @author cdcruzr@unah.edu.hn
	 * @version 0.0.1
	 * @since 2024/12/4
	 * @date  2024/12/4
	 * */
	private String encontrarExpediente(String pacienteNombre) throws SQLException, ClassNotFoundException {
		 String query = "{CALL BuscarExpedientePorNombreApellido(?, ?)}";
		 
		 String[] nombreApellido = pacienteNombre.split(" "); 
		 String n1 = nombreApellido[0];
		 String a1 = nombreApellido[1];
		 String id = "";
		 
		 Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		 PreparedStatement ps = conn.prepareStatement(query);
		 ps.setString(1, n1);
		 ps.setString(2, a1);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()) {
			 id = String.format("%s", rs.getInt(1));
		 }
		 
		return id;
	}
	
}
