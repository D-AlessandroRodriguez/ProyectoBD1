
/**
 * Clase que se encarga de ayudar a establecer el producto del cuál se hará el registro del lote.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/12/05
 * @date 2024/12/05
 */
class ActionSetProduct {
	
	/**
	 * Método que se encarga de establecer el producto del cuál se hará el registro del lote.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @param {HTMLButtonElement} changeProductButton Botón que permite cambiar de producto una vez ya establecido; es activado cuando se establece el producto.
	 */
	static setProductToRegisterBatch(changeProductButton){
		
		let productInput = this;
		
		let dataListOptions = document.querySelectorAll(".dataListOption");
		
		for (let option of dataListOptions) {
			
			if (option.value == productInput.value) {
				
				productInput.dataset.productId = option.dataset.productId;
				this.disabled = true;
				changeProductButton.disabled = false;
				return;
			
			} else {
				
				delete productInput.dataset.productId;
			}
		}
	}
	
	/**
	 * Método que permite cambiar el producto ya establecido para registro de lote.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @param {HTMLInputElement} productInput Input en el que se establece el producto del cuál se quiere registrar un lote.
	 */
	static changeProduct(productInput) {
		
		productInput.value = "";
		productInput.disabled = false;
		this.disabled = true;
		delete productInput.dataset.productId;
	}
}