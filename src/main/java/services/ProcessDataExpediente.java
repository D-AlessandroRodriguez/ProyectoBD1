package services;

import enfermero_rh_DAO.DireccionDAO;
import enfermero_rh_DAO.ExpedienteDAO;
import enfermero_rh_DAO.PacienteDAO;
import enfermero_rh_DAO.PersonaDAO;
import jakarta.servlet.http.HttpServletRequest;

/**
 * Procesa los datos que se envían para crear y guardar nuevas personas
 * 
 * @author 
 * @version 0.1.2
 * @date 2024/11/29
 */
public class ProcessDataExpediente {

    private PersonaDAO createPerson = new PersonaDAO();
    private DireccionDAO direccionPerson = new DireccionDAO();
    private PacienteDAO paciente = new PacienteDAO();
    private ExpedienteDAO expediente = new ExpedienteDAO();
    private Persona persona;
    private Direccion direccion;
    private Paciente pacientedata;

    /**
     * Crea un nuevo expediente, procesando la data recibida
     * 
     * @param request Objeto que contiene los parámetros enviados
     * @return JSON con el estado y el mensaje
     */
    public String craetePerson(HttpServletRequest request) {
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
            String tipoSangre = request.getParameter("TiposDeSangre");
            String estadoPaciente = request.getParameter("EstadosPaciente");
            String telefonoEmergencia = request.getParameter("telefonoEmergencia");

            this.persona = new Persona(dni, rtn, nombre1, nombre2, apellido1, apellido2, fechaNacimiento, sexoPersona);
            this.direccion = new Direccion(pais, depto, ciudad, colonia, referencia);
            this.pacientedata = new Paciente(this.persona, telefonoEmergencia);

            if (this.direccionPerson.createDireccion(this.direccion)) {
                if (this.createPerson.create(this.persona, this.direccion)) {
                    if (this.paciente.createPaciente(pacientedata)) {
                        if (this.expediente.createExpediente(this.pacientedata, tipoSangre, estadoPaciente)) {
                            return new ResponseStatus(true, "Expediente creado exitosamente.").toString();
                        }
                    } else {
                        return new ResponseStatus(false, "Error al crear el paciente.").toString();
                    }
                } else {
                    return new ResponseStatus(false, "Error al crear la persona.").toString();
                }
            } else {
                return new ResponseStatus(false, "Error al crear la dirección.").toString();
            }
        } catch (Exception e) {
            return new ResponseStatus(false, "Error procesando los datos" ).toString();
        }
        return null;
    }
   
}
