
/**
   * Envia una peticion y procesa la respuesta
   * @author agblandin@unha.hn
   * @version 0.1.0
   * @date 2024/15/11
   * @since 2024/15/11
   */
class Action {


	/**
   * Procesa la respuesta que recibe de un servlet
   * @author agblandin@unha.hn
   * @version 0.1.0
   * @date 2024/15/11
   * @since 2024/15/11
   */
	static processResponse(modalError) {

  let xhr = this;


		if (xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status < 300)) {
			let jsonR = JSON.parse(xhr.responseText);
			console.log(xhr.responseText);
			
		}


	}


	/**
  * Crea una peticion y la envia a un servlet
  * @author agblandin@unah.hn
  * @version 0.1.0
  * @date 2024/15/11
  * @since 2024/15/11
  */
	static send(personaData,modalError) {
		
		
		
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/ProyectoBD1/api/expedientePersona");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Action.processResponse.bind(xhr,modalError));
		xhr.send(personaData);

	}



} 
