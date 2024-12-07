package services;

import java.math.BigDecimal;

import enfermero_rh_DAO.AccessDAO;
import enfermero_rh_DAO.DireccionDAO;
import enfermero_rh_DAO.EmpleadoDAO;
import enfermero_rh_DAO.ExpedienteDAO;
import enfermero_rh_DAO.HorarioDAO;
import enfermero_rh_DAO.PacienteDAO;
import enfermero_rh_DAO.PersonaDAO;
import enfermero_rh_DAO.TitulacionesEmpleadoDAO;
import jakarta.servlet.http.HttpServletRequest;

/**
 * Procesa los datos que se envían para guardar nuevos registros.
 * 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/30
 * @since 2024/11/30
 */
public class ProcessDataEmpleado {

	private PersonaDAO createPerson = new PersonaDAO();
	private DireccionDAO direccionPerson = new DireccionDAO();
	private PacienteDAO paciente = new PacienteDAO();
	private ExpedienteDAO expediente = new ExpedienteDAO();
	private HorarioDAO horario = new HorarioDAO();
	private TitulacionesEmpleadoDAO titHora = new TitulacionesEmpleadoDAO();
	private Persona persona;
	private EmpleadoDAO emplead = new EmpleadoDAO();
	private EmpleadoData empleado;
	private Direccion direccion;
	private Paciente pacientedata;

	/**
	 * Obtiene los datos para guardar una nueva persona y crea el expediente.
	 * @param request Objeto que contiene los parámetros enviados en la solicitud
	 * @return Respuesta JSON con el estado y el mensaje
	 */
	public String createEmpleado(HttpServletRequest request) {
		try {
			String nombre1 = request.getParameter("Nombre1");
			String nombre2 = request.getParameter("Nombre2");
			String apellido1 = request.getParameter("Apellido1");
			String apellido2 = request.getParameter("Apellido2");
			String dni = request.getParameter("DNIPersona");
			String rtn = request.getParameter("RTNPersona");
			String sexoPersona = request.getParameter("sexoPersona");
			String fechaNacimiento = request.getParameter("fechaNacimiento");
			Integer pais = Integer.parseInt(request.getParameter("pais"));
			Integer depto = Integer.parseInt(request.getParameter("depto"));
			Integer ciudad = Integer.parseInt(request.getParameter("ciudad"));
			Integer colonia = Integer.parseInt(request.getParameter("colonia"));
			String referencia = request.getParameter("referenciaD");

			String cargo = request.getParameter("cargos");
			String deptoH = request.getParameter("deptosh");
			BigDecimal salario = new BigDecimal(request.getParameter("salario"));
			String fechaIngreso = request.getParameter("fechaIngreso");
			String horario = request.getParameter("horario");
			String email = request.getParameter("email");
			String titluaciones = request.getParameter("titles");

			String[] titulosId = titluaciones.split(",");

			this.persona = new Persona(dni, rtn, nombre1, nombre2, apellido1, apellido2, fechaNacimiento, sexoPersona);
			this.direccion = new Direccion(pais, depto, ciudad, colonia, referencia);

			if (this.direccionPerson.createDireccion(this.direccion)) {
				if (this.createPerson.create(this.persona, this.direccion)) {

					int idCargo = AccessDAO.getId("Cargos", cargo);
					int idDeptoH = AccessDAO.getId("DepartamentosHospital", deptoH);

					this.empleado = new EmpleadoData(this.persona, salario, 1, idDeptoH, idCargo, fechaIngreso);

					if (this.emplead.create(this.empleado, email)) {
						if (this.horario.create(this.empleado, horario)) {

							for (String item : titulosId) {
								if (!this.titHora.create(this.empleado, item)) {
									return new ResponseStatus(false, "Error en la relación de títulos").toString();
								}
							}

							return new ResponseStatus(true, "Empleado creado exitosamente").toString();
						} else {
							return new ResponseStatus(false, "Error al guardar el horario").toString();
						}
					} else {
						return new ResponseStatus(false, "Error al crear el empleado").toString();
					}
				} else {
					return new ResponseStatus(false, "Error al crear la persona").toString();
				}
			} else {
				return new ResponseStatus(false, "Error al crear la dirección").toString();
			}

		} catch (Exception e) {
			return new ResponseStatus(false, "Error al procesar los datos").toString();
		}
	}
}
