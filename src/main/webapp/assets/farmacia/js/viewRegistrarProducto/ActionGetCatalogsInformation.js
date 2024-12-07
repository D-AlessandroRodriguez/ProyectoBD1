
/**
 * Clase que se encarga de realizar peticiones al Backend para traer los registros de los catálogos de la base de datos que sirven para registrar un producto.
 * @author jesus.zepeda@unah.hn
 * @version 0.2.0
 * @since 2024/12/03
 * @date 2024/12/04
 */
class ActionGetCatalogsInformation {
	
	/**
	 * Método que se encarga de procesar la respuesta del Backend a la solicitud para traer el catálogo de categorías de productos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 * @param {HTMLDivElement[]} categoriesCheckboxesCols Array de columnas de bootstrap en las cuáles se insertarán a las categorías como inputs checkbox en un orden específico.
	 */
	static processGetProductCategoriesResponse(categoriesCheckboxesCols=[]) {
		
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
	
	/**
	 * Método que se encarga de realizar la petición al Backend para traer el catálogo de las categorías de productos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 * @param {HTMLDivElement[]} categoriesCheckboxesCols Array de columnas de bootstrap en las cuáles se insertarán a las categorías como inputs checkbox en un orden específico. 
	 */
	static getProductCategoriesCatalog(categoriesCheckboxesCols) {
		
		for (let categoryCheckbox of categoriesCheckboxesCols) {
			
			categoryCheckbox.innerHTML = "";
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "/ProyectoBD1/api/get_product_catalogs?op=3");
		xhr.addEventListener("load",ActionGetCatalogsInformation.processGetProductCategoriesResponse.bind(xhr,categoriesCheckboxesCols));
		xhr.send();	
	}
	
	/**
	 * Método que se encarga de procesar la respuesta del Backend a la solicitud para obtener de la base de datos a la unidad de medida relacionada a un tipo de producto.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 * @param {HTMLInputElement} unidadDeMedidaInput Input el cuál se rellenará con la unidad de medida obtenida de la base de datos por parate del Backend.
	 */
	static processGetMeasurementUnitResponse(unidadDeMedidaInput) {
		
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
	
	/**
	 * Método que se encarga de realizar la petición al Backend de obtener de la base de datos a la unidad de medida asociada a un tipo de dato en específico.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 */
	static getMeasurementUnit(tipoSelect,unidadDeMedidaInput) {
		
		let typeCode = tipoSelect.value;
		
		if (typeCode != "") {
			
			let xhr = new XMLHttpRequest();
			xhr.open("GET", `/ProyectoBD1/api/get_product_catalogs?op=2&typeCode=${typeCode}`);
			xhr.addEventListener("load", ActionGetCatalogsInformation.processGetMeasurementUnitResponse.bind(xhr,unidadDeMedidaInput));
			xhr.send();	
		} else {
			
			unidadDeMedidaInput.value = "";
			unidadDeMedidaInput.data.code = "";
		}
	}
	
	/**
	 * Método que se encarga de procesar la respuesta del Backend a la solicitud de obtener de la base de datos a los catálogos de las marcas de productos y los tipos de productos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 * @param {HTMLSelectElement} marcaSelect Select el cual se debe rellenar con options con su respectiva marca de producto.
	 * @param {HTMLSelectElement} tipoSelect Select el cual se debe rellenar con options con su respectivo tipo de producto.
	 */
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
	
	/**
	 * Método que se encarga de realizar la petición al Backend de obtener de la base de datos a los catálogos de marcas de productos y los tipos de productos.
	 * @author jesus.zepeda@unah.hn
	 * @version 0.2.0
	 * @since 2024/12/03
	 * @date 2024/12/04
	 * @param {HTMLSelectElement} marcaSelect Select el cual se debe rellenar con options con su respectiva marca de producto.
	 * @param {HTMLSelectElement} tipoSelect Select el cual se debe rellenar con options con su respectivo tipo de producto.
	 */
	static getBranchAndTypeCatalogsInformation(marcaSelect,tipoSelect) {
		
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "/ProyectoBD1/api/get_product_catalogs?op=1");
		xhr.addEventListener("load", ActionGetCatalogsInformation.processGetBranchesAndTypesResponse.bind(xhr,marcaSelect,tipoSelect));
		xhr.send();
	}
}