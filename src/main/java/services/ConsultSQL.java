package services;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *Crea consultas de acuerdo a diferentes parametros
 * @author agblandin@unah.hn
 * @version 0.1.1
 * @date 2024/12/02
 * @since 2024/12/02
 */
public class ConsultSQL {


	/**
	 * Crea una consulta de acuerdo a los parametros recibidos
	 * 
	 * @param nombre es el nombre de una tabla de la cual se quiere consultar
	 *  @return returna una consulta SQL
	 */
	public static String getConsult(String nombre, String codigos) {

		String sql;
		if (nombre.equals("CargaPais")) {

			sql = "SELECT Nombre,Id FROM Paises;";
			return sql;
		} else if (nombre.equals("pais")) {

			sql = String.format(
					"SELECT d.Nombre,d.Id   FROM Departamentos d  JOIN Paises p ON d.PaisId = p.Id  WHERE p.Id = %s",
					codigos);
			return sql;

		} else if (nombre.equals("depto")) {
			sql = String.format(
					"SELECT c.Nombre,c.Id  FROM Ciudades c JOIN Departamentos d ON c.DepartamentoId = d.Id WHERE d.Id =  %s",
					codigos);
			return sql;
		} else if (nombre.equals("ciudad")) {
			sql = String.format(
					"SELECT co.Nombre,co.Id   FROM Colonias co JOIN Ciudades c ON co.CiudadId = c.Id WHERE c.Id =  %s",
					codigos);
			return sql;
		} else if (nombre.equals("deptosh")) {
			sql = "SELECT Nombre,Codigo   FROM DepartamentosHospital";
			return sql;
		} else if (nombre.equals("cargos")) {
			sql = "SELECT Nombre,Codigo   FROM Cargos";
			return sql;
		} else if (nombre.equals("horario")) {
			sql = "SELECT Nombre,Id,HoraInicio,HoraFinal  FROM Turnos";
			return sql;
		}else if(nombre.equals("Titulaciones")) {
			return sql = "SELECT Nombre,Id  FROM Titulaciones";
		}else if(nombre.equals("doctor")) {
			System.out.println(nombre + " d");
			return sql = "SELECT Nombre,Id  FROM Especialidades";
		}

		return null;
	}
	
	/**
	 * Obtiene los horarios guradados en la base
	 * 
	 * @param nombre es el nombre de una tabla de la cual se quiere consultar
	 *  @return retorna un json con el nombre,id,horaInicio,horaFin de los horarios
	 */  
	
	public static String getHorarios(ResultSet resultSet) {

		StringBuilder result = new StringBuilder("{\"data\":[");


		try {

			boolean first = true;
			
			while (resultSet.next()) {

				

				String name = resultSet.getString("Nombre");
				String Id = resultSet.getString("Id");
				String hi = resultSet.getString("HoraInicio");
				String hf = resultSet.getString("HoraFinal");

				if (!first) {
					result.append(",");
				}
				result.append("{");
				result.append(String.format("\"Nombre\":\"%s : %s-%s\",", name, hi, hf));
				result.append(String.format("\"Codigo\":\"%s\"", Id));
				result.append("}");
                
				first = false;
			}
			result.append("]}");
			return result.toString();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
