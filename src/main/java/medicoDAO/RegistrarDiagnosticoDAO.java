package medicoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DataBase.DataBaseConnection;

public class RegistrarDiagnosticoDAO {
	/**
	 * hace el insert diagnostico
	 * @author cdcruzr@unah.edu.hn
	 * @version 0.0.1
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @since 2024/12/4
	 * @date  2024/12/4
	 * */
	public String registrarDiagnostico(String pacienteNombre, String observacion, String fecha, int idMedico) throws SQLException, ClassNotFoundException {
		int[] id = encontrarExpediente(pacienteNombre);
		String query = "INSERT INTO Diagnosticos VALUES (?, ?, ?, ?, ?)";
		
		Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, observacion);
		ps.setInt(2, idMedico);
		ps.setString(3, fecha);	
		ps.setInt(4, id[0]);		
		ps.setInt(4,  id[0]);		
		
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
	private int[] encontrarExpediente(String pacienteNombre) throws SQLException, ClassNotFoundException {
		 String query = "EXEC BuscarExpedienteConsuBuscarExpedienteConsulta @Nombre = ?, @Apellido = ?";
		 
		 String[] nombreApellido = pacienteNombre.split(" "); 
		 String n1 = nombreApellido[0];
		 String a1 = nombreApellido[1];
		 
		 int idExpediente = 0;
		 int idConsulta = 0;
		 
		 Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		 PreparedStatement ps = conn.prepareStatement(query);
		 ps.setString(1, n1);
		 ps.setString(2, a1);
		 
		 ResultSet rs = ps.executeQuery();
		 
		 if(rs.next()) {
			 idExpediente =  rs.getInt(1);
			 idConsulta = rs.getInt(2);
		 }
		 int[] listId = {idExpediente, idConsulta};
		 
		return listId;
	}
}
