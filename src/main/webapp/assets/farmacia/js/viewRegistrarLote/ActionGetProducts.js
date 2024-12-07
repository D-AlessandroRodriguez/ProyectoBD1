
/**
 * Clase que se encarga de pedir al Backend la lista de productos registrados y mostrarlos en un datalist para que el usuario pueda escoger el producto del cual se registrará un lote.
 * @author jesus.zepeda@unah.hn
 * @version 0.2.0
 * @since 2024/12/05
 * @date 2024/12/06
 */
class ActionGetProducts {
	
	/**
	 * Método que se encarga de procesar la respuesta de la petición y que además rellena el datalist con los productos recibidos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/05
	 * @date 2024/12/06
	 * @param {DHTMLDataListElement} productsList Elemento del DOM que es rellenado con los productos recibidos del Backend
	 */
	static processgetProductsResponse(productsList) {
		
		let xhr = this;
		
		if (xhr.status >= 200 && xhr.status <= 299) {
			
			let response = JSON.parse(xhr.responseText);
			
			let products = response.products;
			
			for (let product of products) {
				
				productsList.innerHTML += `<option class="dataListOption" data-product-id="${product.id}" value="${product.information}">`;
			}
			
		} else {
			alert("Respuesta inesperada del servidor!");
		}
	}
	
	/**
	 * Método que realiza la petición HTTP al Backend pidiendo los productos registrados en la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 */
	static getProducts(productsList) {
		
		productsList.innerHTML = "";
		
		let xhr = new XMLHttpRequest;
		xhr.open("GET", "/ProyectoBD1/api/get_products");
		xhr.addEventListener("load",ActionGetProducts.processgetProductsResponse.bind(xhr,productsList));
		xhr.send();
	}
}