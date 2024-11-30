
/**
 * Clase que se encarga de mostrar la ventana modal en la que se cargan los productos en las tablas correspondientes (producto disponible o no disponible).
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/11/27
 * @date 2024/11/27
 */
class ModalAction {
	
	/**
	 * Método que se encarga de mostrar la ventana modal con los productos pasados como parámetros en las tablas correspondientes.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/27
	 * @date 2024/11/27
	 * @param {HTMLDivElement} domModal Elemento del DOM que representa a la ventana modal a mostrar.
	 * @param {Array} availableProducts Arreglo que contiene los registros en formato Json de los productos disponibles.
	 * @param {Array} nonAvailableProducts Arreglo que contiene los registros en formato Json de los productos no disponibles.  
	 */
	static showProductosDisponiblesModal(domModal,availableProducts,nonAvailableProducts) {
		
		let productosDisponiblesTbody = document.querySelector("#productosDisponiblesTbody");
		let productosFaltantesTbody = document.querySelector("#productosFaltantesTable").querySelector("tbody");
		
		productosDisponiblesTbody.innerHTML = ``; 
		productosFaltantesTbody.innerHTML = ``;
		
		if (availableProducts.length != 0) {
			
			for (let producto of availableProducts) {
				
				productosDisponiblesTbody.innerHTML += `<tr><td>${producto.productId}</td><td>${producto.batchId}</td><td>${producto.name}</td><td>${producto.quantity}</td></tr>`;
			}
		}
		
		if (nonAvailableProducts != 0) {
			
			for (let producto of nonAvailableProducts) {
				
				productosFaltantesTbody. innerHTML += `<tr><td>${producto.id}</td><td>${producto.name}</td><td>${producto.quantity}</td></tr>`;
			}
		}
		
		const newModal = new bootstrap.Modal(domModal);
		newModal.show();
	}
}