package services;

/**
 * Clase auxiliar para representar la respuesta en formato JSON.
 * @author agblandin@unah.hn
 * @version 0.1.2
 * @date 2024/12/05
 * @since 2024/12/05
 */
public class ResponseStatus {
    private boolean status;
    private String message;

    /**
     * Constructor parametrizado para inicializar los atributos.
     * @param status el estado de la operación 
     * @param message el mensaje descriptivo del resultado
     */
    public ResponseStatus(boolean status, String message) {
        this.status = status;
        this.message = message;
    }

    public ResponseStatus() {
    }

    /**
     * Obtiene el status de la operación.
     * @return {@code true} si la operación fue exitosa, {@code false} en caso contrario
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * Obtiene el mensaje descriptivo del resultado.
     * @return el mensaje del resultado
     */
    public String getMessage() {
        return message;
    }

    /**
     * Convierte el objeto en una cadena de texto en formato JSON.
     * @return una representación en formato JSON de esta instancia
     */
    @Override
    public String toString() {
        StringBuilder result = new StringBuilder();
        result.append("{");
        result.append("\"status\":").append(status).append(",");
        result.append("\"message\":\"").append(message.replace("\"", "\\\"")).append("\"");
        result.append("}");
        return result.toString();
    }
}
