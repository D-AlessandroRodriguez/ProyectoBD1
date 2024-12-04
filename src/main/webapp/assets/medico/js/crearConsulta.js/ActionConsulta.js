class ActionConsulta{
    static getResponseRegistrarReceta(){
        let xhr = this;

        if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
            //recibe respuesta verdadera si se hizo la peticion
        }

    }

    registrarConsulta(arrayParametros){
        let xhr = XMLHttpRequest;

        xhr.open("POST", "ruta");
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.addEventListener("readystatechange", ActionConsulta.getResponseRegistrarReceta.bind(xhr));
        xhr.send(`params=${arrayParametros}`)
    }


}