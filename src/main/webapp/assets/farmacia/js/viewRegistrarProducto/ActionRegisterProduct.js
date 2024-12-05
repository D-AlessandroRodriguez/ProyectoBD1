
/**
 * Clase que recopila los datos de los inputs para poder ser enviados al backend.
 * @author jesus.zepeda@unah.hn, jose.inestroza@unah.edu.hn
 * @version 0.1.0
 * @since 2024/12/03
 * @date 2024/12/03
 */
class ActionRegisterProduct {
	
	static isDataValid(inputsToValidate) {
		
		let isValidData = true;
		
		let nombreComercialInput = inputsToValidate[0];
		let marcaSelect = inputsToValidate[1];
		let tipoSelect = inputsToValidate[2];
		let cantidadDeContenidoInput = inputsToValidate[3];
		let unidadDeMedidaInput = inputsToValidate[4];
		let categoriasCheckboxes = inputsToValidate[5];
		
		if (!Validator.validateProductName(nombreComercialInput)) {
			
			nombreComercialInput.classList.add("is-invalid");
			isValidData = false;
		}
		
		if (!Validator.validateInputSelect(marcaSelect)) {
			
			marcaSelect.classList.add("is-invalid");
			isValidData = false;
		}
		
		if (!Validator.validateInputSelect(tipoSelect)) {
			
			tipoSelect.classList.add("is-invalid");
			isValidData = false;
		}
		
		if (!Validator.validateProductQuantity(cantidadDeContenidoInput)) {
			
			cantidadDeContenidoInput.classList.add("is-invalid");
			isValidData = false;
		}
		
		if (unidadDeMedidaInput.dataset.code == undefined) {
			
			unidadDeMedidaInput.classList.add("is-invalid");
			isValidData = false;
		}
		
		if (!Validator.validateProductCategories(categoriasCheckboxes)) {
			
			isValidData = false;
			categoriasCheckboxes[0].classList.add("is-invalid");
			alert("Debes seleccionar al menos una categoría");
		}
		
		return isValidData;
	}
	
	static removeInvalidClass(inputsToValidate=[]) {
		
		for (let i = 0; i <= 4; i++){
			
			inputsToValidate[i].classList.remove("is-invalid");		
		}
		
		inputsToValidate[5][0].classList.remove("is-invalid");
	}
	
	static processResponse(xhr,inputsToValidate) {
		
		if ((xhr.status >= 200 && xhr.status <=299) && xhr.readyState == XMLHttpRequest.DONE) {
			
			let response = JSON.parse(xhr.responseText);
			
			if (response.status == true) {
				
				ActionRegisterProduct.removeInvalidClass(inputsToValidate);
				
				let productId = response.content.productId;
				
				alert(`Se ha registrado el producto con el id: ${productId}`);
				
				//clearInputs(inputsToValidate);
			
			} else {
				
				alert(`${response.errorMessage}`);
			}
		}
	}
	
	static sendProductInformation(inputsToValidate=[]) {
		
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