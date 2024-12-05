
/**
 * Clase que realiza una petición al backend para solicitar los productos relacionados a una orden de receta determinada.
 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
 * @version 0.1.0
 * @since 2024/11/27
 * @date 2024/11/27
 */
class ActionGetRecipeProducts {
	
	/**
	 * Método que procesa la respuesta a la petición por parte del Servlet, llena la tabla con los productos de la receta recibidos.
	 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/27
	 * @param {HTMLBodyElement} productosDeRecetaTbody Cuerpo de la tabla en el cual se insertarán los datos obtenidos.
	 */
	static processRequestResponse(productosDeRecetaTbody) {
		
		let xhr = this;
		
		if (xhr.status >= 200 && xhr.status <= 299) {
			
			let response = JSON.parse(xhr.responseText);
			
			let data = response.data;
			
			productosDeRecetaTbody.innerHMTL = "";
			
			if (data.length != 0) {
				
				for (let register of data) {
					
					productosDeRecetaTbody.innerHTML += `<tr><th scope="row">${register.id}</th><td>${register.nombre}</td><td>${register.marca}</td><td>${register.tipo}</td><td>${register.cantidad}</td><td>${register.cantidadDosis} ${register.unidad} cada ${register.frecuencia} horas</td></tr>`;
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
	 * @param {string} recipeOrderId Id de la receta de la cuál se quiere obtener los productos.
	 * @param {HTMLBodyElement} productosDeRecetaTbody Cuerpo de la tabla en el cual se insertarán los datos obtenidos. 
	 */
	static getRecipeProducts(recipeOrderId,productosDeRecetaTbody) {
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", `/ProyectoBD1/api/get_recipe_products?id=${recipeOrderId}`);
		xhr.addEventListener("load", ActionGetRecipeProducts.processRequestResponse.bind(xhr,productosDeRecetaTbody));
		xhr.send();
	}
}