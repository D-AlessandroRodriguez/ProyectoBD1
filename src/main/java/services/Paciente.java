package services;

/**
 * Representa un paciente con información personal y su número de teléfono.
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/28
 * @since 2024/11/28
 */
public class Paciente {

    private Persona person;
    private String numberPhone;
    private int id;

    /**
     * Constructor que inicializa un paciente con información personal y número de teléfono.
     * @param person el objeto Persona asociado al paciente
     * @param numberPhone el número de teléfono del paciente
     */
    public Paciente(Persona person, String numberPhone) {
        this.person = person;
        this.numberPhone = numberPhone;
    }

    /**
     * Retorna la información personal del paciente.
     * @return el objeto Persona asociado al paciente
     */
    public Persona getPerson() {
        return person;
    }

    /**
     * Retorna el número de teléfono del paciente.
     * @return el número de teléfono del paciente
     */
    public String getNumberPhone() {
        return numberPhone;
    }

    /**
     * Retorna el identificador único del paciente.
     * @return el identificador único del paciente
     */
    public int getId() {
        return id;
    }

    /**
     * Actualiza el identificador único del paciente.
     * @param id el nuevo valor del identificador único del paciente
     */
    public void setId(int id) {
        this.id = id;
    }
}
