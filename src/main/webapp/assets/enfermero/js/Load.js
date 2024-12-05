class Load {



	/**
	 * Procesa la respuesta que recibe de un servlet
	 * @author 
	 * @version 0.1.0
	 * @date 2024/07/01
	 * @since 2024/07/4
	 */

	static processResponse(select) {

		let xhr = this;


		if (xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status < 300)) {
			let jsonR = JSON.parse(xhr.responseText);

		}


	}


	/**
	* Crea una peticion para cargar los paises
	* @author agblandin@unah.hn
	* @version 0.1.0
	* @date 2024/07/01
	* @since 2024/07/4
	*/
	send(select) {



		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/ProyectoBD1/api/loadPaises");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Load.processResponse.bind(xhr, select));
		xhr.send();

	}







}