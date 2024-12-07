
/**
 * 
 * clase que trae la data para llenar la tabla de consultas
 * @author cdcruzr@unah.hn, jose.inestroza@unah.edu.hn
 * @version 0.1.0
 * @since 2024/11/27
 * @date 2024/11/27
 */
class ActionConsultas{
	/**
	 * Método que procesa la respuesta a la petición por parte del Servlet, llena la tabla con los productos de la receta recibidos.
	 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/27
	 * @param {HTMLBodyElement} bodyTableConsultas Cuerpo de la tabla en el cual se insertarán los datos obtenidos.
	 */
	static processRequestResponse(bodyTableConsultas) {		
		let xhr = this;
		if (xhr.status >= 200 && xhr.status <= 299) {
			let response = JSON.parse(xhr.responseText);
			let data = response.data;
			bodyTableConsultas.innerHMTL = "";
			
			if (data.length != 0) {
				for (let item of data) {
					let register = JSON.parse(item);
					bodyTableConsultas.innerHTML += `
					<tr>
					<th scope="row">${register.id}</th>
					<td>${register.paciente}</td>
					<td>${register.fecha}</td>
					</tr>`;
				}
			}
			
		} else {
			alert("Respuesta inesperada de petición");
		}
	}
	
	/**
	 * Método que realiza una petición http al Servlet que devuelve los productos de una receta determinada.
	 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/27
	 * @param {HTMLBodyElement} bodyTableConsultas Cuerpo de la tabla en el cual se insertarán los datos obtenidos. 
	 */
	static getConsultas(bodyTableConsultas) {
		let xhr = new XMLHttpRequest();
		
		xhr.open("POST", "/ProyectoBD1/api/GetConsultas");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.addEventListener("load", ActionConsultas.processRequestResponse.bind(xhr,bodyTableConsultas));
		xhr.send();
	}
}