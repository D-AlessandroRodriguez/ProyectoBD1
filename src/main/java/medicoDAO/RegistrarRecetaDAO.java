package medicoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import DataBase.DataBaseConnection;
/**
 * 
 * 
 * */
public class RegistrarRecetaDAO {
	private int pacienteId;
	
	public RegistrarRecetaDAO(String pacienteId) {
		this.pacienteId = Integer.parseInt(pacienteId);
	}
	public String registrarReceta(Map<String, String> valores) throws SQLException, ClassNotFoundException {	
		String query = "EXEC insertOrdenRecetasProductos @RecetaId = ?, @ProductoId = ?, @CantProductos = ?, @CantDosis = ?, @UnidadMedidaId = ?, @FrecuenciaHoras = ?, @DuracionDias = ?, @CantEntregados = ?";
		int unidadMedidaId = encontrarUnidadMedida(valores.get("unidadMedida"));
		
		Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setInt(1,  encontrarRecetaId()); //RecetaId
		ps.setString(2, valores.get("id")); //productoId
		ps.setInt(3, Integer.parseInt( valores.get("cantProducto"))); //cant
		ps.setDouble(4,  Integer.parseInt(valores.get("dosis"))); //dosis
		ps.setInt(5, unidadMedidaId); //unidadMedidaId valores.get("unidadMedida");
		ps.setInt(6, Integer.parseInt(valores.get("frecuencia"))); //frecuencia
		ps.setInt(7, Integer.parseInt(valores.get("duracionsDia"))); //duracionDIas
		ps.setInt(9, 0); //cantidad entregados
		
		
		ps.setAsciiStream(0, null);
		
		int rs = ps.executeUpdate();
		ps.close();
		
		return "filas afectadas"+ rs;
	}
	/**
	 * 
	 * 
	 * */
	private int encontrarUnidadMedida(String nombreUnidadMedida) throws SQLException, ClassNotFoundException {
		 String query = "SELECT Id FROM UnidadesDeMedida WHERE Nombre Like ?";
		 int idUnidadMedida = 0;
		 
		 Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		 PreparedStatement ps = conn.prepareStatement(query);
		 ps.setString(1, nombreUnidadMedida);
		 
		 ResultSet rs = ps.executeQuery();
		 if(rs.next()) {
			 idUnidadMedida =  rs.getInt(1);
		 }
		 ps.close();
		 
		return idUnidadMedida;
	}
	/**
	 * 
	 * 
	 * */
	private int encontrarRecetaId() throws SQLException, ClassNotFoundException {
		 String query = "EXEC BuscarExpedienteConsulta @idPaciente = ?";
		 
		 int idConsulta = 0;
		 
		 Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		 PreparedStatement ps = conn.prepareStatement(query);
		 ps.setInt(1, this.pacienteId);
		 
		 ResultSet rs = ps.executeQuery();
		 if(rs.next()) {
			 idConsulta = rs.getInt(2);
		 }
		 
		return idConsulta;
	}
	
}
