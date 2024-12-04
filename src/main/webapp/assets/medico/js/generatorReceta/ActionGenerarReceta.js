class ActionGenerarReceta{
	/**
	 * con este metodo procesamos la respuesta cuando se requiere autollenar select marca
	*/
	static responseDataSelectMarca(selectMarca){
		let xhr = this;
		
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			let dataMarca = JSON.parse(xhr.responseText);
			
			let option = document.createElement('option');
			option.value = dataMarca.marcaId;
			option.textContent = dataMarca.marcaName;
			option.selected = true;
			selectMarca.appendChild(option);	
			}
		}
	/**
	 * con este metodo procesamos la respuesta para llenar el select de productos con los productos de la base de datos
	*/	
	static responseDataSelectProduct(selectNombreProducto){
		let xhr = this;
		
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			let data = JSON.parse(xhr.responseText);

			selectNombreProducto.innerHTML = '<option selected>Seleccione el producto</option>';
			selectMarca.innerHTML = '<option selected>Seleccione la marca</option>';
			for (let item of data.productos) {
				let jsonItem = JSON.parse(item);
				
				let option = document.createElement('option');
				option.dataset.idProducto = jsonItem.IdProducto;
				option.value = jsonItem.id;
				option.textContent = jsonItem.NombreComercial;
				selectNombreProducto.appendChild(option);		
			}
		}
	}
	static responseInsertReceta(){
		let xhr = this;
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			let data = JSON.parse(xhr.responseText);
			
		}
	}
	
	/**
	* peticion para seleccionar la marca de acuerdo al id del producto
	*/
	actionSendSelect(selectMarca, selectProducto) {
		let idProducto = selectProducto.options[selectProducto.selectedIndex].dataset.idProducto;
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "/ProyectoBD1/api/generarRecetaDynamicMarca");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionGenerarReceta.responseDataSelectMarca.bind(xhr, selectMarca));
		xhr.send(`idProduct=${idProducto}`);
	}
	/**
	* peticion para llenar el select de productos
	*/
	cargarProductos(selectNombreProducto){
		const xhr = new XMLHttpRequest();
			xhr.open("POST", "/ProyectoBD1/api/generaRecetaDynamicProducto");
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.addEventListener("readystatechange", ActionGenerarReceta.responseDataSelectProduct.bind(xhr, selectNombreProducto));
			xhr.send();
	}
	/**
	 * se realiza la peticion para mandar la data
	 */
	insertReceta(){
		let load;
		if (ls.isGetLocalStorage()) {
			load = JSON.parse(ls.loadLocalStorage());
		}
		
		let xhr = XMLHttpRequest;
		xhr.open("POST", "/ProyectoBD1/api/insertReceta");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionGenerarReceta.responseInsertReceta.bind(xhr));
		xhr.send(`arrayReceta=${load}`);
	}
	/**
	* permite cargar todas las recetas registradas  para despues mandar a insertar a la base de datos
	*/
	loadStorage(arrayElement, bodyTable) {
		for (let item of arrayElement) {
	    let tr = document.createElement("tr");
			for (let key of Object.keys(item)) {
				let th = document.createElement("th");
				th.scope = "row";
				th.textContent = item[key];
				tr.appendChild(th);
			}
			bodyTable.appendChild(tr);	
		}
	}
	/**
	* aqui se crea un json con los elementos para guardarlo en localStorage 
	*/
		createLocalStorage(list, bodyTable){
		let ls = new LocalStorageRR();
		const text = document.querySelector("#textError");
		let modalError = document.querySelector("#modalError");

		//creo el objeto con el registro actual
		let jsonElement = {
		      id: Date.now(), 
		      nombreProducto: list[0].options[list[0].selectedIndex].text,
		      marca: list[1].options[list[1].selectedIndex].text,
		      cantProducto: list[2].options[list[2].selectedIndex].text,
		      dosis: list[3].value,
		      frecuencia: list[4].value,
		      unidadMedida: list[5].value
		  }
		 //valido los campos o parametros
		if (Validator.ParametrosVacios(jsonElement)) {
				let tr = document.createElement("tr");
			for (let key in jsonElement){
				let th = document.createElement("th");
				th.scope = "row";
				th.textContent = jsonElement[key];
				tr.appendChild(th);
			}
			bodyTable.appendChild(tr);
			ls.saveLocalStorage(jsonElement);
		}else{
			text.textContent = "Llene todos los parametros requeridos";
			const toast = new bootstrap.Toast(modalError);
			toast.show();
		}
	}
}