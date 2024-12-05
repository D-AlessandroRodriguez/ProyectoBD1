
/**
 * Clase que realiza una petición al backend para solicitar los productos disponibles de entrega y no disponibles de una receta determinada.
 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
 * @version 0.1.0
 * @since 2024/11/28
 * @date 2024/11/28
 */
class ActionGetAvailableProducts {
	
	/**
	 * Método que procesa la respuesta a la petición por parte del Servlet, mostrando la ventana modal con los datos obtenidos.
	 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
	 * @version 0.1.0
	 * @since 2024/11/28
	 * @date 2024/11/28
	 * @param {HTMLDivElement} domModal Div de la ventana modal en donde se mostrará la disponibilidad de los productos.
	 */
	static processRequestResponse(domModal) {
		
		let xhr = this;
				
		if (xhr.status >= 200 && xhr.status <= 299) {
			
			let response = JSON.parse(xhr.responseText);
			
			let data = response.data;
			
			let availableProducts = data.availableProducts;
			let nonAvailableProducts = data.nonAvailableProducts;
			
			ModalAction.showProductosDisponiblesModal(domModal,availableProducts,nonAvailableProducts);
			
		} else {
			
			alert("Respuesta inesperada de petición");
		}
	}
	
	/**
	 * Método que realiza una petición http al Servlet que devuelve los productos disponibles y no disponobles de una receta determinada.
	 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
	 * @version 0.1.0
	 * @since 2024/11/28
	 * @date 2024/11/28
	 * @param {string} recipeOrderId Id de la receta de la cuál se quiere obtener los productos.
	 * @param {HTMLDivElement} domModal Div de la ventana modal en donde se mostrará la disponibilidad de los productos. 
	 */
	static getAvailableProducts(recipeOrderId,domModal) {
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", `/ProyectoBD1/api/get_available_products?id=${recipeOrderId}`);
		xhr.addEventListener("load", ActionGetAvailableProducts.processRequestResponse.bind(xhr,domModal));
		xhr.send();
	}
}