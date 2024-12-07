
/**
 * Clase que se encarga de todo lo relacionado al registro de un lote de producto.
 * @author jesus.zepeda@unah.hn
 * @version 0.2.0
 * @since 2024/12/05
 * @date 2024/12/06
 */
class ActionRegisterBatch {
	
	/**
	 * Clase que se encarga de decidir si todos los datos introducidos en los inputs para el registro de un lote son válidos o no.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @param {Array} [dataInputs] Array que contiene a los inputs con los datos a ser validados. 
	 */
	static isValidData(dataInputs) {
		
		let productInput = dataInputs[0];
		let productionDateInput = dataInputs[1];
		let expirationDateInput = dataInputs[2];
		let batchQuantityInput = dataInputs[3];
		
		let isValidData = true;
		let validationMessages = [];
		
		if (!Validator.isValidProduct(productInput)) {
			
			productInput.classList.add("is-invalid");
			validationMessages.push("- El producto no existe.");
			isValidData = false;
		}
		
		if (!Validator.isValidProductionDate(productionDateInput)) {
			
			productionDateInput.classList.add("is-invalid");
			validationMessages.push("- La fecha de elaboración del producto debe ser menor o igual que la fecha actual.");
			isValidData = false;
		}
		
		if (!Validator.isValidExpirationDate(expirationDateInput)) {
			
			expirationDateInput.classList.add("is-invalid");
			validationMessages.push("- La fecha de vencimiento debe ser mayor que la fecha actual.");
			isValidData = false;
		}
		
		if (!Validator.areValidDates(productionDateInput,expirationDateInput)) {
			
			productionDateInput.classList.add("is-invalid");
			validationMessages.push("- La fecha de elaboración del producto no puede ser mayor o igual que la fecha de vencimiento del producto.");
			isValidData = false;
		}
		
		if (!Validator.isValidQuantity(batchQuantityInput)) {
			
			batchQuantityInput.classList.add("is-invalid");
			validationMessages.push("- La cantidad ingresada es inválida.");
			isValidData = false;
		}
		
		let validationFeedback = "";
		
		for (let i = 0; i < validationMessages.length; i++) {
			
			if (i != 0) {
				validationFeedback += "\n";
			}
			validationFeedback += validationMessages[i];
		}
		
		if (validationFeedback != "") {
			
			alert(`${validationFeedback}`);
		}
		
		return isValidData;
	}
	
	/**
	 * Método que se encarga de remover la clase de bootstrap que aplica estilo a la validación a los inputs que están con datos no válidos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 * @param {aArray} dataInputs Array de los inputs a los cuáles se les debe remover la clase .is-invalid de Bootstrap.
	 */
	static removeInvalidClass(dataInputs) {
			
		for (let input of dataInputs){
			
			input.classList.remove("is-invalid");		
		}
	}
	
	/**
	 * Método que se encarga de limpiar los inputs.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/05
	 * @date 2024/12/05
	 */
	static clearInputs(dataInputs) {
		
		for (let input of dataInputs) {
			input.value = "";
		}
		document.querySelector("#changeProductButton").disabled = true;
		document.querySelector("#identificacionProductoInput").disabled = false;
		delete document.querySelector("#identificacionProductoInput").dataset.productId;
	}
	
	/**
	 * Método que se encarga de procesar la respuesta de la solicitud de registro de lote hecha al Backend.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/05
	 * @date 2024/12/06
	 * @param {Array} dataInputs Array de inputs los cuales deben limpiarse si el registro del lote fue exitoso, y así quedar listas para realizar un nuevo registro.
	 */
	static processRegisterBatchResponse(dataInputs) {
		
		let xhr = this;
		
		if ((xhr.status >= 200 && xhr.status <=299) && xhr.readyState == XMLHttpRequest.DONE) {
			
			let response = JSON.parse(xhr.responseText);
			
			if (response.status==true) {
				
				let batchId = response.content.batchId;
				
				ActionRegisterBatch.clearInputs(dataInputs);
				
				alert(`Se ha registrado el lote con el id: ${batchId}`);
			
			} else {
				
				alert(`${response.errorMessage}`);
			}
		}
	}
	
	/**
	 * Método que se encarga de realizar la petición de registro de lote al Backend.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/05
	 * @date 2024/12/06
	 * @param {Array} [dataInputs] Array de los inputs en los que el usuario ingresa la información de registro de un lote. 
	 */
	static registerBatch(dataInputs) {
		
		ActionRegisterBatch.removeInvalidClass(dataInputs);
		
		if (ActionRegisterBatch.isValidData(dataInputs)) {
			
			let productId = dataInputs[0].dataset.productId;
			let productionDate = dataInputs[1].value;
			let expirationDate = dataInputs[2].value;
			let batchQuantity = dataInputs[3].value;
			
			let parameters = `productId=${productId}&productionDate=${productionDate}&expirationDate=${expirationDate}&batchQuantity=${batchQuantity}`;
			
			let xhr = new XMLHttpRequest();
			xhr.open("POST","/ProyectoBD1/api/register_batch");
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.addEventListener("readystatechange", ActionRegisterBatch.processRegisterBatchResponse.bind(xhr,dataInputs));
			xhr.send(parameters);
		}
	}
}