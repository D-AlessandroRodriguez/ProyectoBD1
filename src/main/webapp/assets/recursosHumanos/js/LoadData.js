class LoadData {

	/**
	 * Procesa la respuesta que recibe de un servlet y crea las opciones
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

			option.text = "seleccionar";
			option.value = "";
			select.appendChild(option);

			for (let item of paises) {
				let option = document.createElement("option");
				option.text = item.Nombre;
				option.value = item.Codigo;
				select.appendChild(option);
			}
		}
	}

	/**
	 * Procesa la respuesta que recibe de un servlet y crea las opciones para las titulaciones
	 * @author 
	 * @version 0.1.0
	 * @date 2024/07/01
	 * @since 2024/07/4
	 */
	static processResponseT(select) {
		let xhr = this;

		if (xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status < 300)) {
			let jsonR = JSON.parse(xhr.responseText);
			let titulaciones = jsonR.Titulaciones;

			let max = titulaciones.length;
			let mid = Math.ceil(max / 2);

			let divContainer1 = document.createElement("div");
			divContainer1.classList.add("col-md-6");

			let divContainer2 = document.createElement("div");
			divContainer2.classList.add("col-md-6");

			let cont = 0;
			for (let i = 0; i < max; i++) {
				let item = titulaciones[i];

				let div = document.createElement("div");
				let input = document.createElement("input");
				input.type = "checkbox";
				input.id = item.Codigo;
				input.name = "optionTitulaciones";
				input.value = item.Codigo;

				let label = document.createElement("label");
				label.innerText = item.Nombre;
				label.setAttribute("for", "optionTitulaciones");
				div.appendChild(input);
				div.appendChild(label);

				if (i < mid) {
					divContainer1.appendChild(div);

				} else {
					divContainer2.appendChild(div);

				}
			}
			select.appendChild(divContainer1);
			select.appendChild(divContainer2);
		}
	}


	/**
	 * Crea una petición para cargar datos
	 * @author agblandin@unah.hn
	 * @version 0.1.0
	 * @date 2024/07/01
	 * @since 2024/07/4
	 */
	send(value, select) {
		let nombre = "nombre";
		let codigo = "codigo";

		let data = [`${nombre}=${value.name}`];

		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/ProyectoBD1/api/loadPaises");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		if (`${value.id}` == "Titulaciones") {
			xhr.send(`${nombre}=Titulaciones`);
			xhr.addEventListener("readystatechange", LoadData.processResponseT.bind(xhr, select));
		} else {
			xhr.addEventListener("readystatechange", LoadData.processResponse.bind(xhr, select));
			xhr.send(data);
		}
	}

	/**
	 * Obtiene los valores ingresados en los campos del formulario
	 * @author jose.ineztrosa@unah.edu.hn
	 * @version 0.1.0
	 * @date 2024/11/20
	 * @since 2024/11/20
	 * @returns retorna un arreglo con el nombre y valor de cada campo
	 * @param {HTMLDivElement} inputs conjunto de inputs donde ingreso los datos
	 */
	static getData(inputs) {
		let data = [];
		for (let item of inputs) {
			data.push(`${item.name}=${item.value}`);
		}
		return data.join("&");
	}
}
