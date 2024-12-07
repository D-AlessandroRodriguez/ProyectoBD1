
class ActionMedico {
	
	constructor (url1, url2, saveButton, secondSaveButton) {
		this.url1 = url1;
		this.url2 = url2;
		this.saveButton = saveButton;
		this.secondSaveButton = secondSaveButton;
	}
	
	showModal (modalDiv, clickEvent){
		let modal = new bootstrap.Modal(modalDiv);
		modal.show();
	}
	
	getDataFirstModal (clickEvent){
		let primerNombre = document.querySelector("#primerNombre").value;
		let segundoNombre = document.querySelector("#segundoNombre").value;
		let primerApellido = document.querySelector("#primerApellido").value;
		let segundoApellido = document.querySelector("#segundoApellido").value;
		let fecha = document.querySelector("#fecha").value;
		let DNI = document.querySelector("#DNI").value;
		let RTN = document.querySelector("#RTN").value;
		let correo = document.querySelector("#correo").value;
		let telefono = document.querySelector("#telefono").value;
		let sexo = document.querySelector("#sexo").value;
		let pais = document.querySelector("#pais").value;
		let depto = document.querySelector("#depto").value;
		let ciudad = document.querySelector("#ciudad").value;
		let colonia = document.querySelector("#colonia").value;
		let referencia = document.querySelector("#referencia").value;
		let deptoHospital = document.querySelector("#deptoHospital").value;
		let cargo = document.querySelector("#cargo").value;
		let especialidad = document.querySelector("#especialidad").value;
		

		// Verificamos que no se envíe el formulario si algunos campos están vacíos 
		// !depto || !ciudad || !colonia ||
		if (!primerNombre || !primerApellido || !DNI || !fecha || !correo || !telefono || !sexo || !pais || !deptoHospital || !cargo || !especialidad) {
			alert("Los campos son obligatorios.");
		    return;
		}
		
		let dataFirstModal = { 
			primerNombre, segundoNombre, primerApellido, segundoApellido, 
			fecha, correo, telefono, sexo,
			pais, depto, ciudad, colonia, referencia
		};
		
		this.sendDataFirstModal(dataFirstModal);
	}

	
	sendDataFirstModal(dataFirstModal) {
		let xhr = new XMLHttpRequest();
	    xhr.open("POST", this.url1, true); // true indica que el método es asíncrono 
	    xhr.setRequestHeader("Content-Type", "application/json");
		xhr.addEventListener("readystatechange", this.processResponseFirstModal(xhr));
		
		// Convierte los datos a JSON y los envía
	    xhr.send(JSON.stringify(dataFirstModal));
	}
	
	processResponseFirstModal (xhr) {
		//let xhr = this;
		
		if (xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status < 300)) {
			alert("Datos enviados correctamente.");	
			
			// Obtenemos el campo donde vamos a insertar el valor del correo por defecto para crear un nuevo usuario
			const dataRecibida = JSON.parse(xhr.responseText); // me devuelve un JSON con todos los campos con su llave y valor
			const correoIngresado = dataRecibida.Correo; //obtenemos el email que ya fue ingresado en el formulario y guardado en la base de datos, esto es un string
			
			document.querySelector("#correoIngresado").value = correoIngresado; //asignamos ese valor
			
			const idPersonaIngresada = dataRecibida.PersonaId; // obtenemos el id de la persona ingresada recientemente
			const idEmpleadoIngresado = dataRecibida.EmpleadoId;
			
			// Abrimos la segunda modal para crear usuarios y asignar roles y permisos, además de capturar esa data 
			
			let crearUsuario = document.querySelector("#crearUsuario"); 
			this.saveButton.addEventListener("click", action.showModal.bind(action, crearUsuario));
			this.secondSaveButton.addEventListener("click", action.getDataSecondModal.bind(action, idPersonaIngresada, idEmpleadoIngresado, correoIngresado));
			
			const nuevoEmpleado = {
				id: dataRecibida.PersonaId,
			    nombre1: dataRecibida.nombre1,
			    apellido1: dataRecibida.apellido1,
			    departamento: dataRecibida.departamento,
			    cargo: dataRecibida.cargo,
			    usuario: dataRecibida.usuario,
			    perfil: dataRecibida.perfil
			};

			// Mantener la tabla actualizada
			table.ajax.reload(); 
			
		} else {
		    alert("Error al enviar los datos: " + this.statusText);
		}
		
	}
	
	getDataSecondModal (idPersonaIngresada, idEmpleadoIngresado, correoIngresado, clickEvent){
		let pwd = document.querySelector("#pwd").value;
		let rol = document.querySelector("#rol").value;
		
		// Verificamos que no se envíe el formulario si algunos campos están vacíos 
		if (!pwd || !rol) {
			alert("Los campos son obligatorios.");
			return;
		}
				
		let dataSecondModal = {pwd, rol, idPersonaIngresada, idEmpleadoIngresado, correoIngresado};
				
		this.sendDataSecondModal(dataSecondModal);		
	}
	
	sendDataSecondModal (dataSecondModal){
		let xhr = new XMLHttpRequest();	
		xhr.open("POST", this.url2, true); // true indica que el método es asíncrono 
		xhr.setRequestHeader("Content-Type", "application/json");
		xhr.addEventListener("readystatechange", this.processResponseSecondModal(xhr));
				
		// Convierte los datos a JSON y los envía
		xhr.send(JSON.stringify(dataSecondModal));
	}
	
	processResponseSecondModal (xhr) {
		//let xhr = this;
			
		if (xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status < 300)) {
			alert("Datos enviados correctamente.");
		} else {
		    alert("Error al enviar los datos: " + this.statusText);
		}
			
	}	
}


let registrarEmpleadoModal = document.querySelector("#registrarEmpleadoModal");
let selectPais = document.querySelector("#selectPais");
let selectDeptos = document.querySelector("#selectDeptos"); 
let saveButton = document.querySelector("#saveButton"); 
let secondSaveButton = document.querySelector("#secondSaveButton"); 

let action = new ActionMedico("api/setEmployee", "/api/setUser", saveButton, secondSaveButton);

registrarEmpleadoModal.addEventListener("click", action.showModal.bind(action, registrarEmpleadoModal));
saveButton.addEventListener("click", action.getDataFirstModal.bind(action));


