
/**
 * Clase que recopila los datos de los inputs para poder ser enviados al backend.
 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
 * @version 0.1.0
 * @since 2024/12/03
 * @date 2024/12/03
 */
class ActionRegisterProduct {
	
	/**
	 * Clase que se encarga de decidir si todos los datos introducidos en los inputs para el registro de un lote son válidos o no.
 	 * @author jesus.zepeda@unah.hn
 	 * @version 0.1.0
 	 * @since 2024/12/03
 	 * @date 2024/12/03
 	 * @param {Array} inputsToValidate Array que contiene a los inputs con los datos a ser validados. 
	 */
	static isDataValid(inputsToValidate) {
		
		let isValidData = true;
		let validationMessages = [];
		
		let nombreComercialInput = inputsToValidate[0];
		let marcaSelect = inputsToValidate[1];
		let tipoSelect = inputsToValidate[2];
		let cantidadDeContenidoInput = inputsToValidate[3];
		let unidadDeMedidaInput = inputsToValidate[4];
		let categoriasCheckboxes = inputsToValidate[5];
		
		if (!Validator.validateProductName(nombreComercialInput)) {
			
			nombreComercialInput.classList.add("is-invalid");
			validationMessages.push("- El nombre del producto no es válido.");
			isValidData = false;
		}
		
		if (!Validator.validateInputSelect(marcaSelect)) {
			
			marcaSelect.classList.add("is-invalid");
			validationMessages.push("- Debes seleccionar una marca.");
			isValidData = false;
		}
		
		if (!Validator.validateInputSelect(tipoSelect)) {
			
			tipoSelect.classList.add("is-invalid");
			validationMessages.push("- Debes seleccionar un tipo de producto.");
			isValidData = false;
		}
		
		if (!Validator.validateProductQuantity(cantidadDeContenidoInput)) {
			
			cantidadDeContenidoInput.classList.add("is-invalid");
			validationMessages.push("- La cantidad de contenido del producto ingresada es inválida.");
			isValidData = false;
		}
		
		if (unidadDeMedidaInput.dataset.code == undefined) {
			
			unidadDeMedidaInput.classList.add("is-invalid");
			validationMessages.push("- Debes seleccionar un tipo de producto para que definamos la unidad de medida de su contenido.");
			isValidData = false;
		}
		
		if (!Validator.validateProductCategories(categoriasCheckboxes)) {
			
			isValidData = false;
			categoriasCheckboxes[0].classList.add("is-invalid");
			validationMessages.push("- Debes seleccionar al menos una categoría.");
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
	 * Método que se encarga de remover la clase is-invalid de Bootstrap de los inputs que contienen data de registro inválida.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/03
	 * @date 2024/12/03
	 * @param {Array} inputsToValidate Array de inputs de los cuáles se removerá la clase de Bootstrap.
	 */
	static removeInvalidClass(inputsToValidate=[]) {
		
		for (let i = 0; i <= 4; i++){
			
			inputsToValidate[i].classList.remove("is-invalid");		
		}
		
		inputsToValidate[5][0].classList.remove("is-invalid");
	}
	
	/**
	 * Método que se encarga de limpiar los inputs luego de registrar un producto.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/03
	 * @date 2024/12/03
	 * @param {Array} inputsToValidate Array de los inputs que serán limpiados.
	 */
	static clearInputs(inputsToValidate) {
		
		inputsToValidate[0].value = "";
		let selectsToClear = document.querySelectorAll("select > option[value='']");
		
		for (let select of selectsToClear) {
			
			select.selected = true;
		}
		
		inputsToValidate[3].value = "";
		inputsToValidate[4].value = "";
		
		let checkboxesToClear = inputsToValidate[5];
		
		for (let checkbox of checkboxesToClear) {
			
			checkbox.checked = false;
		}
	}
	
	/**
	 * Método que se encarga de procesar la respuesta del Backend a la solicitud de registrar un producto en la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/03
	 * @date 2024/12/03
	 * @param {XMLHttpRequest} xhr Objeto que realiza la petición asíncrono al Backend.
	 * @param {Array} inputsToValidate Array de inputs de los cuales se removerá la clase is-invalid y se limpiará su contenido.
	 */
	static processResponse(xhr,inputsToValidate) {
		
		if ((xhr.status >= 200 && xhr.status <=299) && xhr.readyState == XMLHttpRequest.DONE) {
			
			let response = JSON.parse(xhr.responseText);
			
			if (response.status == true) {
				
				ActionRegisterProduct.removeInvalidClass(inputsToValidate);
				
				let productId = response.content.productId;
				
				ActionRegisterProduct.clearInputs(inputsToValidate);
				
				alert(`Se ha registrado el producto con el id: ${productId}`);
			
			} else {
				
				alert(`${response.errorMessage}`);
			}
		}
	}
	
	/**
	 * Método que se encarga de realizar la petición al Backend de registrar un producto en la base de datos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/03
	 * @date 2024/12/03
	 * @param {Array} inputsToValidate Array de inputs que contienen los datos del producto a ser registrado.
	 */
	static sendProductInformation(inputsToValidate) {
		
		inputsToValidate.push(document.querySelectorAll("input[name='categorias']"));
		
		ActionRegisterProduct.removeInvalidClass(inputsToValidate);
		
		if (ActionRegisterProduct.isDataValid(inputsToValidate)) {
			
			let productName = inputsToValidate[0].value;
			let productBranch = inputsToValidate[1].value;
			let productType = inputsToValidate[2].value;
			let productQuantity = inputsToValidate[3].value;
			let productMeasurementUnit = inputsToValidate[4].dataset.code;
			let productCategories = [];
			
			let categoriesCheckboxes = inputsToValidate[5];
			
			for (let i = 0; i < categoriesCheckboxes.length; i++) {
				
				if (categoriesCheckboxes[i].checked==true) {
					
					productCategories.push(categoriesCheckboxes[i].value);	
				}
			}
			
			let productCategoriesParameter = "productCategories=";
			
			for (let i = 0; i < productCategories.length; i++) {
				
				if (i == 0) {
					
					productCategoriesParameter += `${productCategories[i]}`;
				
				} else {
					
					productCategoriesParameter += `,${productCategories[i]}`;	
				}
			}
			
			let requestParameters = `productName=${productName}&productBranch=${productBranch}&productType=${productType}&productQuantity=${productQuantity}&productMeasurementUnit=${productMeasurementUnit}&${productCategoriesParameter}`;
			
			let xhr = new XMLHttpRequest();
			xhr.open("POST", "/ProyectoBD1/api/register_product");
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.addEventListener("readystatechange", ActionRegisterProduct.processResponse.bind(this,xhr,inputsToValidate));
			xhr.send(requestParameters);
		}
	}
}