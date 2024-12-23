class ActionGenerarReceta{
	constructor(){
		this.arrayReceta = [];
	}
	
	
	/**
	 * con este metodo procesamos la respuesta cuando se requiere autollenar select marca
	*/
	static responseDataSelectMarca(selectMarca, selectselectUnidadDeMedida){
		let xhr = this;
		
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			let dataMarca = JSON.parse(xhr.responseText);
			
			let option = document.createElement('option');
			option.value = dataMarca.marca.marcaId;
			option.textContent = dataMarca.marca.marcaName;
			option.selected = true;
			selectMarca.appendChild(option);	
			
			let optionUM = document.createElement('option');
			optionUM.value = dataMarca.unidad.unidadId;
			optionUM.textContent = `${dataMarca.unidad.codigo} - ${dataMarca.unidad.unidadName}`;
			optionUM.selected = true;
			selectselectUnidadDeMedida.appendChild(optionUM);
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
				option.value = jsonItem.IdProducto;
				option.textContent = `${jsonItem.IdProducto} - ${jsonItem.NombreComercial}`;
				selectNombreProducto.appendChild(option);		
			}
		}
	}
	/**
	 * 
	 * procesamos respuesta de insertar ordenDeRecetaProducto
	 * 
	 */
	static responseInsertReceta(){
		let xhr = this;
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			//let data = JSON.parse(xhr.responseText);
			
		}
	}
	/**
	 * procesamos para data para agregar la informacion de los pacientes
	 * 
	 */
	static getResponsePacientes(selectPacientes, lblNombreDoctor){
		let xhr = this;
		
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			let jsonPacientesDoctor = JSON.parse(xhr.responseText);
			
				lblNombreDoctor.innerText = jsonPacientesDoctor.nombreMedico;

				for (let item of jsonPacientesDoctor.paciente) {
				let jsonItem = JSON.parse(item);
				
				let option = document.createElement('option');
				option.value = jsonItem.id;
				option.textContent = `${jsonItem.n1} ${jsonItem.a1}`;
				
				selectPacientes.appendChild(option);
			}
		}
	}
	/**
	* peticion para seleccionar la marca de acuerdo al id del producto
	*/
	actionSendSelect(selectMarca, selectProducto, selectUnidadDeMedida) {
		let idProducto = selectProducto.options[selectProducto.selectedIndex].dataset.idProducto;
		
		const xhr = new XMLHttpRequest();
		xhr.open("POST", "/ProyectoBD1/api/generarRecetaDynamicMarca");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionGenerarReceta.responseDataSelectMarca.bind(xhr, selectMarca, selectUnidadDeMedida));
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
	insertReceta(selectNombrePaciente){
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/ProyectoBD1/api/insertReceta");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionGenerarReceta.responseInsertReceta.bind(xhr));
		xhr.send(`arrayReceta=${JSON.stringify(this.arrayReceta)}&pacienteId${selectNombrePaciente.value}`);
	}
	 /**
	 * peticion para traer todos los paciente
	 */
	 loadCargarPacientes(selectPacientes, lblNombreDoctor){
	 	let xhr = new XMLHttpRequest();
	 	
	 	xhr.open("POST", "/ProyectoBD1/api/loadPaciente");
	 	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	 	xhr.addEventListener("readystatechange", ActionGenerarReceta.getResponsePacientes.bind(xhr, selectPacientes, lblNombreDoctor));
	 	xhr.send();
	 }
	/**
	* aqui se crea un json con los elementos para guardarlo en localStorage 
	*/
	createLocalStorage(list, bodyTable) {
		const text = document.querySelector("#textError");
		let modalError = document.querySelector("#modalError");

		//creo el objeto con el registro actual
		let jsonElement = {
			id: list[0].options[list[0].selectedIndex].dataset.idProducto, //cambiar ese data.now()
			nombreProducto: list[0].options[list[0].selectedIndex].text,
			marca: list[1].options[list[1].selectedIndex].text,
			cantProducto: list[2].value,
			dosis: list[3].value,
			frecuencia: list[4].value,
			unidadMedida: list[5].options[list[1].selectedIndex].text,
			duracionsDias: list[6].value
		}
		//valido los campos o parametros
		if (Validator.ParametrosVacios(jsonElement)) {
			let tr = document.createElement("tr");
			for (let key in jsonElement) {
				let th = document.createElement("th");
				th.scope = "row";
				th.textContent = jsonElement[key];
				tr.appendChild(th);
			}
			bodyTable.appendChild(tr);
			this.arrayReceta.push(jsonElement);
		} else {
			text.textContent = "Llene todos los parametros requeridos";
			const toast = new bootstrap.Toast(modalError);
			toast.show();
		}	
	}
}
