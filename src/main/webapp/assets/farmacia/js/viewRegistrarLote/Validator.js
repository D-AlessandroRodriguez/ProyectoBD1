
/**
 * Clase que se encarga de validar los datos de los inputs de registro de un lote de producto.
 * @author jesus.zepeda@unah.hn
 * @version 0.1.0
 * @since 2024/12/05
 * @date 2024/12/05
 */
class Validator {
	
	/**
	 * Método que se encarga de la validación del input donde se establece el producto a ser registrado.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 */
	static isValidProduct(productInput) {
		
		if (productInput.value == "") {
			return false;
		}
		
		let dataListOptions = document.querySelectorAll(".dataListOption");
		for (let option of dataListOptions) {
			if (option.value == productInput.value) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * Método que se encarga de valida el input en donde el usuario elige o escribe la fecha de elaboración del lote a ser registrado.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @param {HTMLInputElement} productionDateInput Input donde se escribe o elige la fecha de elaboración del lote a registrar.
	 */
	static isValidProductionDate(productionDateInput) {
		
		if (productionDateInput.value == "") {
			return false;	
		}
		
		let productionDate = new Date(productionDateInput.value);
		let currentDate = new Date();
		
		if (productionDate <= currentDate) {
			return true;
		}
		return false;
	}
	
	/**
	 * Método que se encarga de validar el input en donde el usuario escribe o elige la fecha de vencimiento del lote a ser registrado.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @param {HTMLInputElement} expirationDateInput Input en donde el usuario escribe o elige la fecha de vencimiento del lote a registrar.
	 */
	static isValidExpirationDate(expirationDateInput) {
		
		if (expirationDateInput.value == "") {
			return false;
		}
		
		let expirationDate = new Date(expirationDateInput.value);
		let currentDate = new Date();
		
		if (expirationDate > currentDate) {
			return true;
		}
		return false;
	}
	
	/**
	 * Método que se encarga de validar que los inputs de fecha de elaboración y fecha de vencimiento contengan fechas coherentes entre sí.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @param {HTMLInputElement} productionDateInput Input donde se escribe o elige la fecha de elaboración del lote a registrar.
	 * @param {HTMLInputElement} expirationDateInput Input en donde el usuario escribe o elige la fecha de vencimiento del lote a registrar.
	 */
	static areValidDates(productionDateInput,expirationDateInput) {
		
		if (productionDateInput.value == "" || expirationDateInput.value == ""){
			return false;
		}
		
		let productionDate = new Date(productionDateInput.value);
		let expirationDate = new Date(expirationDateInput.value);
		
		if (productionDate < expirationDate) {
			return true;
		}
		return false;
	}
	
	/**
	 * Método que se encarga de validar el input en donde el usuario ingresa la cantidad de productos del lote a ser registrados.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 */
	static isValidQuantity(batchQuantityInput) {
		
		if (batchQuantityInput.value == "" || batchQuantityInput.value == "0") {
			return false;
		}
		
		if (batchQuantityInput.value.match(/[0-9]*/)) {
			return true;
		}
		return false;
	}
}