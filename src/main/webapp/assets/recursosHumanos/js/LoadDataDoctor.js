class LoadDataDoctor {

	/**
	 * Procesa la respuesta que recibe de un servlet y crea los campos y opciones para las titulaciones de doctores.
	 * @author 
	 * @version 0.1.0
	 * @date 2024/12/06
	 * @since 2024/12/06
	 * @param {HTMLDivElement} select contenedor donde se agregan los elementos generados.
	 */
	static processResponseT(select) {
		let xhr = this;

		if (xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status < 300)) {
			let jsonR = JSON.parse(xhr.responseText);
			let titulaciones = jsonR.data;

			let max = titulaciones.length;
			let mid = Math.ceil(max / 2);

			let divContainer3 = document.createElement("div");
			divContainer3.classList.add("col-md-2");

			let numeroC = document.createElement("label");
			numeroC.innerText = "Número de Colegiado";
			numeroC.setAttribute("for", "numeroColegiado");
			numeroC.classList.add("form-label", "fw-bold");

			let inputC = document.createElement("input");
			inputC.type = "text";
			inputC.id = "numeroColegiado";
			inputC.name = "numeroColegiado";
			inputC.classList.add("form-control");

			divContainer3.appendChild(numeroC);
			divContainer3.appendChild(inputC);

			let divContainer1 = document.createElement("div");
			divContainer1.classList.add("col-md-5");

			let divContainer2 = document.createElement("div");
			divContainer2.classList.add("col-md-5");

			for (let i = 0; i < max; i++) {
				let item = titulaciones[i];

				let div = document.createElement("div");
				let input = document.createElement("input");
				input.type = "checkbox";
				input.id = "opEspec";
				input.name = "opEspec";
				input.value = item.Codigo;

				let label = document.createElement("label");
				label.innerText = item.Nombre;
				label.setAttribute("for", item.Codigo);

				div.appendChild(input);
				div.appendChild(label);

				if (i < mid) {
					divContainer1.appendChild(div);
				} else {
					divContainer2.appendChild(div);
				}
			}

			select.appendChild(divContainer3);
			select.appendChild(divContainer1);
			select.appendChild(divContainer2);
		}
	}

	/**
	 * Crea una solicitud para cargar datos relacionados con doctores y actualiza el DOM según la respuesta recibida.
	 * @param {HTMLDivElement} dataDoctor contenedor donde se colocarán los datos generados.
	 * @param {HTMLSelectElement} option opción seleccionada en el formulario.
	 */
	load(dataDoctor, option) {
		if (`${option.value}` == "DM001" ||`${option.value}` == "MG001" ) {
			let data = [`nombre=doctor`];

			let xhr = new XMLHttpRequest();
			xhr.open("POST", "/ProyectoBD1/api/loadPaises");
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.addEventListener("readystatechange", LoadDataDoctor.processResponseT.bind(xhr, dataDoctor));
			xhr.send(data);
		} else {
			dataDoctor.innerHTML = "";
		}
	}
}
