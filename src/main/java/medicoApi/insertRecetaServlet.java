package medicoApi;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import medicoDAO.RegistrarRecetaDAO;

@WebServlet(description = "recibe los parametros para insert en la base  de datos la receta", urlPatterns = { "/api/insertReceta" })
public class insertRecetaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertRecetaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String recetas = request.getParameter("arrayReceta");
		String jsonTexto = recetas;

		String pacienteId = request.getParameter("arrayReceta");
		
        try {
            if (jsonTexto.startsWith("[") && jsonTexto.endsWith("]")) {
                jsonTexto = jsonTexto.substring(1, jsonTexto.length() - 1);
            }

            String[] objetosJson = jsonTexto.split("\\},\\{");
            RegistrarRecetaDAO rr = new RegistrarRecetaDAO(pacienteId);
            
            for (int i = 0; i < objetosJson.length; i++) {
                // Limpiar cada objeto individual
                String objeto = objetosJson[i];
                if (i == 0) {
                    objeto = objeto + "}";
                } else if (i == objetosJson.length - 1) {
                    objeto = "{" + objeto;
                } else {
                    objeto = "{" + objeto + "}";
                }
                
               Map<String, String> valores = procesarObjetoJson(objeto);
               rr.registrarReceta(valores);
               
               System.out.println("Objeto " + (i + 1) + ": " + valores.get("marca"));
            }
            response.getWriter().write("INSERT INTO correcto a ordenRecetaProductos");
        } catch (Exception e) {
            response.getWriter().write("Error al procesar el JSON: " + e.getMessage());
        }
    }

    // Método auxiliar para procesar un objeto JSON individual
    private Map<String, String> procesarObjetoJson(String objetoJson) {
        Map<String, String> mapa = new HashMap<>();

        // Quitar llaves y comillas del objeto
        objetoJson = objetoJson.replace("{", "").replace("}", "").replace("\"", "");

        // Separar pares clave:valor
        String[] pares = objetoJson.split(",");

        for (String par : pares) {
            String[] claveValor = par.split(":");
            if (claveValor.length == 2) {
                mapa.put(claveValor[0].trim(), claveValor[1].trim());
            }
        }

        return mapa;
    }
}
