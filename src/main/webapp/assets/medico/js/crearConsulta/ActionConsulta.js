class ActionConsulta{
    static getResponseRegistrarReceta(){
        let xhr = this;

        if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
            //recibe respuesta verdadera si se hizo la peticion
        }

    }

    registrarConsulta(arrayParametros){
        let xhr = new XMLHttpRequest();
		console.log(arrayParametros[0]);
				
        xhr.open("POST", "/ProyectoBD1/api/ingresarConsulta");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.addEventListener("readystatechange", ActionConsulta.getResponseRegistrarReceta.bind(xhr));
        xhr.send(`paciente=${arrayParametros[0].value}&fecha${arrayParametros[1].value}&hora=${arrayParametros[2].value}
					costo=${arrayParametros[3].value}`);
	}
}