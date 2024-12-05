class ActionConsulta{
    /**
	 * respuestas de peteciones
	 */
	static getResponseRegistrarReceta(){
        let xhr = this;

        if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
            //recibe respuesta verdadera si se hizo la peticion
        }

    }
	
	static getResponsePacientes(selectPacientes, lblNombreDoctor){
		let xhr = this;
		
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			let jsonPacientesDoctor = JSON.parse(xhr.responseText);
			
			lblNombreDoctor.innerText = JSON.parse(jsonPacientesDoctor.nombreDoctor);
			
			for (let item of jsonPacientesDoctor.pacientes) {
				let jsonItem = JSON.parse(item);
				
				let option = document.createElement('option');
				option.value = jsonItem.Id;
				option.textContent = `${jsonItem.n1}-${jsonItem.a1}`;
				selectPacientes.appendChild(option);
			}
		}
	}
	/**
	 * peticiones
	 */
    registrarConsulta(arrayParametros){
        let xhr = new XMLHttpRequest();
				
        xhr.open("POST", "/ProyectoBD1/api/ingresarConsulta");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.addEventListener("readystatechange", ActionConsulta.getResponseRegistrarReceta.bind(xhr));
        xhr.send(`paciente=${arrayParametros[0].options[arrayParametros[0].selectedIndex].text.value}&fecha${arrayParametros[1].value}&hora=${arrayParametros[2].value}
					costo=${arrayParametros[3].value}`);
	}
	
	loadCargarPacientes(selectPacientes, lblNombreDoctor){
		let xhr = XMLHttpRequest();
		
		xhr.open("POST", "/ProyectoBD1/api/loadPaciente");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", getResponsePacientes.bind(xhr, selectPacientes, lblNombreDoctor));
		xhr.send();
	}
}