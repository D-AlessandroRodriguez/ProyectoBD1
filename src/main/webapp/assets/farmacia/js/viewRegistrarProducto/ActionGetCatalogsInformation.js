
class ActionGetCatalogsInformation {
	
	static processGetProductCategoriesResponse(categoriesCheckboxesCols) {
		
		let xhr = this;
		
		if (xhr.status >= 200 && xhr.status <= 299) {
			
			let response = JSON.parse(xhr.responseText);
			
			let productCategories = response.productCategories;
			
			for (let i = 0; i < productCategories.length; i++) {
				
				let columnIndex = i % (categoriesCheckboxesCols.length);
				
				categoriesCheckboxesCols[columnIndex].innerHTML += `<div class="form-check">`;
				categoriesCheckboxesCols[columnIndex].innerHTML += `<input name="categorias" class="form-check-input" type="checkbox" value="${productCategories[i].code}" id="categoria${i}Check">`;
				categoriesCheckboxesCols[columnIndex].innerHTML += `<label class="form-check-label" for="categoria${i}Check">${productCategories[i].name}</label>`;
				categoriesCheckboxesCols[columnIndex].innerHTML += `</div>`;
			}
			
		} else {
			
			alert("Respuesta inesperada del servidor!");
		}
	}
	
	static getProductCategoriesCatalog(categoriesCheckboxesCols) {
		
		for (let categoryCheckbox of categoriesCheckboxesCols) {
			
			categoryCheckbox.innerHTML = "";
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "/ProyectoBD1/api/get_product_catalogs?op=3");
		xhr.addEventListener("load",ActionGetCatalogsInformation.processGetProductCategoriesResponse.bind(xhr,categoriesCheckboxesCols));
		xhr.send();	
	}
	
	static processGetMeasurementUnitsResponse(unidadDeMedidaInput) {
		
		let xhr = this;
		
		if (xhr.status >= 200 && xhr.status <= 299) {
			
			let response = JSON.parse(xhr.responseText);
			
			let measurementUnit = response.measurementUnit;
			
			unidadDeMedidaInput.dataset.code = measurementUnit.code;
			unidadDeMedidaInput.value = measurementUnit.name;
			
		} else {
			
			alert("Respuesta inesperada del servidor!");
		}
	}
	
	static getMeasurementUnit(tipoSelect,unidadDeMedidaInput) {
		
		let typeCode = tipoSelect.value;
		
		if (typeCode != "") {
			
			let xhr = new XMLHttpRequest();
			xhr.open("GET", `/ProyectoBD1/api/get_product_catalogs?op=2&typeCode=${typeCode}`);
			xhr.addEventListener("load", ActionGetCatalogsInformation.processGetMeasurementUnitsResponse.bind(xhr,unidadDeMedidaInput));
			xhr.send();	
		} else {
			
			unidadDeMedidaInput.value = "";
			unidadDeMedidaInput.data.code = "";
		}
	}
	
	static processGetBranchesAndTypesResponse(marcaSelect,tipoSelect) {
		
		let xhr = this;
		if (xhr.status >= 200 && xhr.status <= 299) {
			
			let response = JSON.parse(xhr.responseText);
			
			let branches = response.branches;
			let types = response.types;
			
			for (let i = 0; i < branches.length; i++) {
				
				if (i == 0) {
					
					marcaSelect.innerHTML = '<option value="" selected>Selecciona</option>';
				}
				
				marcaSelect.innerHTML += `<option value="${branches[i].code}">${branches[i].name}</option>`;
			}
			
			for (let i = 0; i < types.length; i++) {
				
				if (i == 0) {
					
					tipoSelect.innerHTML = `<option value="" selected>Selecciona</option>`;
				}
				
				tipoSelect.innerHTML += `<option value="${types[i].code}">${types[i].name}</option>`;
			}
		
		} else {
			
			alert("Respuesta inesperada del servidor!");
		}
	}
	
	static getBranchAndTypeCatalogsInformation(marcaSelect,tipoSelect) {
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "/ProyectoBD1/api/get_product_catalogs?op=1");
		xhr.addEventListener("load", ActionGetCatalogsInformation.processGetBranchesAndTypesResponse.bind(xhr,marcaSelect,tipoSelect));
		xhr.send();
	}
}