class ActionDiagnostico{
	/**
	 * procesa la respuesta de la peticion para cargar los pasientes
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/4
	 * @date 2024/12/4
	 * 
	 * @param {Select DOM} selectPacientes elemento html select en donde iran el nombre de todos los pacientes 
	 * @param {label} lblNombreDoctor label donde  va el nombre de
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
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/4
	 * @date 2024/12/4
	 */
	static getResponseDiagnostico(){
		let xhr = this;

		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			let jsonResponse = JSON.parse(xhr.responseText);
			if(!jsonResponse.status){
				window.alert(jsonResponse.message);
			}else{
				window.alert("Se ingreso correctamente el diagnostico");
			}
		}		
	}
	/**
	 * metodo que realiza una peticion para cargar los pasientes y el nombre del doctor
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @since 2024/12/4
	 * @date 2024/12/4
	 * 
	 * @param {Select DOM} selectPacientes elemento html select en donde iran el nombre de todos los pacientes 
	 * @param {label} lblNombreDoctor label donde  va el nombre de
	 */
	loadCargarPacientes(selectPacientes, lblNombreDoctor) {
		let xhr = new XMLHttpRequest();

		xhr.open("POST", "/ProyectoBD1/api/loadPaciente");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionDiagnostico.getResponsePacientes.bind(xhr, selectPacientes, lblNombreDoctor));
		xhr.send();
	}
	/**
	* metodo que realiza una peticion insertar el diagnostico
	* @author cdcruzr@unah.hn
	* @version 0.1.0
	* @since 2024/12/4
	* @date 2024/12/4
	* 
	* @param {Select DOM} selectNombrePacciente elemento html select en donde iran el nombre de todos los pacientes 
	* @param {textarea} observaciones elemento html donde va las observaciones del diagnostico 
	*/
	insertDiagnostico(selectNombrePaciente, observaciones, fecha) {
		let xhr = new XMLHttpRequest();

		xhr.open("POST", "/ProyectoBD1/api/insertDiagnosticoServlet");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionDiagnostico.getResponseDiagnostico.bind(xhr));
		xhr.send(`idPaciente=${selectNombrePaciente.value}&paciente=${selectNombrePaciente.options[selectNombrePaciente.selectedIndex].text}&observaciones=${observaciones.value}&fecha=${fecha.value}`);
	}
}