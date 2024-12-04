package medicoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DataBase.DataBaseConnection;

public class RegistrarConsultaDAO {

	public String registrarConsulta(String paciente, String fecha, String hora, String costo) throws ClassNotFoundException, SQLException {
		String query = "";
		Connection conn = new DataBaseConnection("medico", "medico123").getConnection();
		PreparedStatement ps = conn.prepareStatement(query);
		ps.setString(1, paciente);
		ps.setString(2, fecha);
		ps.setString(3, hora);
		ps.setString(4, costo);
		
		int rs = ps.executeUpdate();
		
		return "filas afectadas"+ rs;
	}
}
