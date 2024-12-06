class ActionConsulta{
    /**
	 * para hacer el insert solo tendremos un true en donde sabremos si se hizo el insert
	 */
	static getResponseRegistrarReceta(){
        let xhr = this;

        if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
            //recibe respuesta verdadera si se hizo la peticion
        }

    }
	/**
	 * crea los option del select en donde se ubicara los nombres de los pacicentes
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
	 * peticion para hacer el insert a la base de datos 
	 */
    registrarConsulta(arrayParametros){
        let xhr = new XMLHttpRequest();
		
        xhr.open("POST", "/ProyectoBD1/api/ingresarConsulta");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.addEventListener("readystatechange", ActionConsulta.getResponseRegistrarReceta.bind(xhr));
        xhr.send(`paciente=${arrayParametros[0].options[arrayParametros[0].selectedIndex].text}&fecha=${arrayParametros[1].value}&hora=${arrayParametros[2].value}&costo=${arrayParametros[3].value}`);
	}
	/**
	 * peticion para cargar los pacicentes en el select
	 * 
	 */
	loadCargarPacientes(selectPacientes, lblNombreDoctor){
		let xhr = new XMLHttpRequest();
		
		xhr.open("POST", "/ProyectoBD1/api/loadPaciente");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionConsulta.getResponsePacientes.bind(xhr, selectPacientes, lblNombreDoctor));
		xhr.send();
	}
}