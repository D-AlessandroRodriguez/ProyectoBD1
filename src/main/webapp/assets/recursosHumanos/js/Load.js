class Load {
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

			let paises = jsonR.data;


			select.innerHTML = "";
			let option = document.createElement("option");

			option.text = "selecionar";
			option.value = "";
			select.appendChild(option);



			for (let item of paises) {

				let option = document.createElement("option");

				option.text = "selecionar";
				option.value = item.Codigo;
				option.text = item.Nombre;
				select.appendChild(option);
			}
		}
	}



	/**
	* Crea una peticion para cargar  los datos de las direcciones
	* @author agblandin@unah.hn
	* @version 0.1.0
	* @date 2024/07/01
	* @since 2024/07/4
	*/
	send(value, select) {
		let nombre = "nombre";
		let codigo = "codigo";


		let data1 = `${nombre}=${value.name}`;
		let data2 = `${codigo}=${value.value}`;
		let data = [data1, data2].join("&");
		let dataP = [`nombre=CargaPais`];



		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/ProyectoBD1/api/loadPaises");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.addEventListener("readystatechange", Load.processResponse.bind(xhr, select));
		if (`${value.value}`.length == 0) {
			xhr.send(dataP);
		} else {
			xhr.send(data);

		}
	}

	/**
		* Obtiene los valores ingresados en loc campos del formulario
		* @author jose.ineztrosa@unah.edu.hn
		* @version 0.1.0
		* @date 2024/11/20
		* @since 22024/11/20
		* @returns retorna un arreglo con el nombre y valor de cada campo
		* @param {HTMLDivElement} inputs  conjunto de inputs donde ingreso los datos
		*/
	static getData(inputs) {
		let data = [];
		for (let item of inputs) {
			data.push(`${item.name}=${item.value}`);
		}
		return data.join("&");
	}


}