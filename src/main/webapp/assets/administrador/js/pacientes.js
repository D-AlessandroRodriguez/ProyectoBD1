class ActionPacientes {
	
	constructor (url, saveButton) {
		this.url = url;
		this.saveButton = saveButton;
	}
	
	showModal (modalDiv, clickEvent){
		let modal = new bootstrap.Modal(modalDiv);
		modal.show();
	}
	
	getData (clickEvent){
		let primerNombre = document.querySelector("#primerNombre").value;
		let segundoNombre = document.querySelector("#segundoNombre").value;
		let primerApellido = document.querySelector("#primerApellido").value;
		let segundoApellido = document.querySelector("#segundoApellido").value;
		let fecha = document.querySelector("#fecha").value;
		let DNIPaciente = document.querySelector("#DNIPaciente").value;
		let telefono = document.querySelector("#telefono").value;
		let sexo = document.querySelector("#sexo").value;
		let pais = document.querySelector("#pais").value;
		let depto = document.querySelector("#depto").value;
		let ciudad = document.querySelector("#ciudad").value;
		let colonia = document.querySelector("#colonia").value;
		let referencia = document.querySelector("#referencia").value;
		let NumTelEmergencia = document.querySelector("#NumTelEmergencia").value;
		

		// Verificamos que no se envíe el formulario si algunos campos están vacíos 
		// !depto || !ciudad || !colonia ||
		if (!primerNombre || !primerApellido || !DNI || !fecha || !telefono || !sexo || !pais || !NumTelEmergencia) {
			alert("Los campos son obligatorios.");
		    return;
		}
		
		let data = { 
			primerNombre, segundoNombre, primerApellido, segundoApellido, 
			fecha, telefono, sexo, DNIPaciente,
			pais, depto, ciudad, colonia, referencia, NumTelEmergencia
		};
		
		this.sendData(data);
	}
	
	sendData (data){
		let xhr = new XMLHttpRequest();	
		xhr.open("POST", this.url, true); // true indica que el método es asíncrono 
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.addEventListener("readystatechange", this.processResponse.bind(xhr));
				
		// Convierte los datos a JSON y los envía
		xhr.send(JSON.stringify(data));
	}
	
	processResponse() {
		let xhr = this;
			
		if (xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status < 300)) {
			alert("Datos enviados correctamente.");
			
			// Obtenemos el campo donde vamos a insertar el valor del correo por defecto para crear un nuevo usuario
			const dataRecibida = JSON.parse(xhr.responseText); 
			const nuevoPaciente = {
				id: dataRecibida.PersonaId,
				nombre1: dataRecibida.nombre1,
				apellido1: dataRecibida.apellido1,
				DNIPaciente: dataRecibida.DNIPaciente,
				telefono: dataRecibida.telefono,
				NumTelEmergencia: dataRecibida.NumTelEmergencia,
				expediente: dataRecibida.expediente
			};
			
			// Agregar el nuevo paciente a la tabla manualmente
			table.row.add(nuevoPaciente).draw(); // Esto agregará la fila a la tabla DataTable
			
		} else {
		    alert("Error al enviar los datos: " + this.statusText);
		}
			
	}	
}


let registrarPacienteModal = document.querySelector("#registrarPacienteModal");
let selectPais = document.querySelector("#selectPais");
let selectDeptos = document.querySelector("#selectDeptos"); 
let saveButtonPaciente = document.querySelector("#saveButtonPaciente"); 

let action = new ActionMedico("api/setPaciente", saveButton);

registrarEmpleadoModal.addEventListener("click", action.showModal.bind(action, registrarPacienteModal));
saveButtonPaciente.addEventListener("click", action.getData.bind(action));


