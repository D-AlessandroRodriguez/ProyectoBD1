class ActionDiagnostico{
	/**
	 * procesa la respuesta de la peticion para cargar los pasientes
	 */
	static getResponsePacientes(selectPacientes, lblNombreDoctor) {
		let xhr = this;

		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
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
	 * peticion donde recibe si se hizo correcto el insert diagnostico
	 * 
	 */
	getResponseDiagnostico(){
		let xhr = this;

		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			let jsonPacientesDoctor = JSON.parse(xhr.responseText);
			//procesar el true
		}		
	}
	/**
	 * metodo para cargar los pasientes y el nombre del doctor
	 */
	loadCargarPacientes(selectPacientes, lblNombreDoctor) {
		let xhr = new XMLHttpRequest();

		xhr.open("POST", "/ProyectoBD1/api/loadPaciente");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionDiagnostico.getResponsePacientes.bind(xhr, selectPacientes, lblNombreDoctor));
		xhr.send();
	}
	/**
	 * metodo para insertar diagnostico
	 * 
	 */
	insertDiagnostico(observaciones, fecha) {
		let xhr = new XMLHttpRequest();

		xhr.open("POST", "/ProyectoBD1/api/loadPaciente");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionDiagnostico.getResponseDiagnostico.bind(xhr, selectPacientes, lblNombreDoctor));
		xhr.send(`observaciones=${observaciones.value}&fecha${fecha.value}`);
	}
}