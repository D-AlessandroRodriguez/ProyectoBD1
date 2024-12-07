class LoadData {



	/**
	 * Procesa la respuesta que recibe de un servlet y crea las opcciones
	 * @author 
	 * @version 0.1.0
	 * @date 2024/07/01
	 * @since 2024/07/4
	 */

	static processResponse(select) {

		let xhr = this;


		if (xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status < 300)) {

			let jsonR = JSON.parse(xhr.responseText);

			let data = jsonR.data;

			select.innerHTML = "";
			let option = document.createElement("option");

			option.text = "selecionar";
			option.value = "";
			select.appendChild(option);

			for (let item of data) {

				let option = document.createElement("option");

				option.text = "selecionar";
				option.value = item.Codigo;
				option.text = item.Nombre;
				select.appendChild(option);
			}
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
		
	
		
		let data = [`${select.name}=${select.name}`];


		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/ProyectoBD1/api/load");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", LoadData.processResponse.bind(xhr, select));
		xhr.send(data);

	


	}

}