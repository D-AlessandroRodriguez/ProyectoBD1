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
	 * @version 0.1.0
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @since 2024/12/4
	 * @date  2024/12/4
	 * */
	public String registrarDiagnostico(String idPaciente, String pacienteNombre, String observacion, String fecha, int idMedico) throws SQLException, ClassNotFoundException {
		int[] id = encontrarExpediente(Integer.parseInt(idPaciente));
		String query = "EXEC insertDiagnostico @observaciones = ?, @ExpedienteId = ?, @MedicoId = ?, @Fecha = ?, @consultaId = ?";
		
		Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, observacion);
		ps.setInt(2, id[0]);		
		ps.setInt(3, idMedico);
		ps.setString(4, fecha);	
		ps.setInt(5,  id[1]);		
		
		int rs = ps.executeUpdate();
		
		return "filas afectadas"+ rs;
	}
	/**
	 * encuentra el expediente mediante join en un proceso almacenado
	 * @author cdcruzr@unah.edu.hn
	 * @version 0.1.1
	 * @since 2024/12/4
	 * @date  2024/12/4
	 * */
	private int[] encontrarExpediente(int idPaciente) throws SQLException, ClassNotFoundException {
		 String query = "EXEC BuscarExpedienteConsulta @idPaciente = ?";
		 
		 int idExpediente = 0;
		 int idConsulta = 0;
		 
		 Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		 PreparedStatement ps = conn.prepareStatement(query);
		 ps.setInt(1, idPaciente);
		 
		 ResultSet rs = ps.executeQuery();
		 if(rs.next()) {
			 idExpediente =  rs.getInt(1);
			 idConsulta = rs.getInt(2);
		 }
		 int[] listId = {idExpediente, idConsulta};
		 
		return listId;
	}
}
