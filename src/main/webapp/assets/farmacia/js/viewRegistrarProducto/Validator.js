
/**
 * Clase que valida el contenido de los inputs antes de ser enviados al Backend
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/12/03
 * @date 2024/12]/03
 */
class Validator {
	
	/**
	 * Método que valida que un nombre del producto no contenga algunos caracteres especiales no deseados.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/03
	 * @date 2024/12/03
	 * @param {HTMLInputElement} nombreComercialInput Input del DOM en que el usuario escribe el nombre del producto.
	 * @returns {boolean} Si el input posee un nombre comercial de producto válido o no.
	 */
	static validateProductName(nombreComercialInput) {
	
		if (`${nombreComercialInput.value}`.match(/[-A-za-zÁÉÍÓÚáéíóú \.]/g)) {
			
			return true;
		}
		return false;
	}
	
	/**
	 * Método que valida que se haya seleccionado un elemento de un input select.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/03
	 * @date 2024/12/03
	 * @param {HTMLSelectElement} marcaSelect Input del DOM del cual el usuario debe seleccionar un elemento.
	 * @returns {boolean} Si el usuario seleccionó o no seleccionó un elemento del select.
	 */
	static validateInputSelect(marcaSelect) {
		
		if (`${marcaSelect.value}`.length != 0) {
			
			return true;
		}
		return false;
	}
	
	/**
	 * Método que valida que se cumpla el formato decimal solicitado para guardar la cantidad del producto.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/03
	 * @date 2024/12/03
	 * @param {HTMLInputElement} cantidadDeContenidoInput Input del DOM en donde el usuario escribe la cantidad del producto.
	 * @returns {boolean} Si el valor ingresado cumple con el formato esperado o no.
	 */
	static validateProductQuantity(cantidadDeContenidoInput) {
		
		if (`${cantidadDeContenidoInput.value}`.match(/[\d]{1,13}([.]\d{1,2})?/)) {
			
			return true;
		}
		return false;
	}
	
	/**
	 * Método que verifica que haya por lo menos un checkbox de categoría de producto seleccionado.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/03
	 * @date 2024/12/03
	 * @param {HTMLInputElement[]} [categoriesCheckboxes=[]] Array de inputs de tipo checkbox en donde el usuario selecciona a qué categorías pertenece el producto a registrar.
	 * @returns {boolean} Si hay o no al menos un checkbox seleccionado. 
	 */
	static validateProductCategories(categoriesCheckboxes = []) {
		
		let isSomeCheckboxSelected = false;
		
		for (let categoryCheckbox of categoriesCheckboxes) {
			
			if (categoryCheckbox.checked) {
				isSomeCheckboxSelected = true;
				return isSomeCheckboxSelected;
			}
		}
		return isSomeCheckboxSelected;
	}
}