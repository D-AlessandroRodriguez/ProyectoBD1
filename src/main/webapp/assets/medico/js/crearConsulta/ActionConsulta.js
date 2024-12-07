/**
* clase donde se realizacion las peticiones y se manejan las respuestas para crear consultas
* @author cdcruzr@unah.hn
* @version 0.1.0
* @since 2024/11/29
* @date 2024/11/30
*/
class ActionConsulta{
    /**
	* metodo de respuesta para saber si se inserto la receta
	* @author cdcruzr@unah.hn
	* @version 0.1.0
	* @since 2024/11/30
	* @date 2024/11/30
	*/
	static getResponseRegistrarReceta(){
        let xhr = this;

        if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
            let jsonResponse = JSON.parse(xhr.responseText);
			
			if(!jsonResponse.status){
				window.alert(jsonResponse.message);
			}else{
				window.alert(jsonResponse.filasAfectadas);
			}
			
        }
    }
	/**
	 * crea los option del select en donde se ubicara los nombres de los pacicentes
	 * @author cdcruzr@unah.hn
	 * @version 0.1.2
	 * @since 2024/11/29
	 * @date 2024/11/30
	 * 
	 * @param {element select} selectPacientes
	 * @param {element label} lblNombreDoctor  
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
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/29
	 * @date 2024/11/30
	 * 
	 * @param {arreglo de elementos del dom} arrayParametros 
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
	 * @author cdcruzr@unah.hn
	 * @version 0.1.0
	 * @since 2024/11/30
     * @date 2024/11/30
	 * 
	 * @param {element select} selectPacientes
	 * @param {element label} lblNombreDoctor  
	 */
	loadCargarPacientes(selectPacientes, lblNombreDoctor){
		let xhr = new XMLHttpRequest();
		
		xhr.open("POST", "/ProyectoBD1/api/loadPaciente");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", ActionConsulta.getResponsePacientes.bind(xhr, selectPacientes, lblNombreDoctor));
		xhr.send();
	}
}