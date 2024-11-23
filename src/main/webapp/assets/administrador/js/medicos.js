

class Action {
	
	showModal (registrarEmpleadoModal, clickEvent){
		let modal = new bootstrap.Modal(registrarEmpleadoModal);
		modal.show();
	}
	
	departamentosHN(selectPais, selectDeptos, clickEvent){
		const departamentos = {
		      hn: [
		        { value: "manzana", text: "Manzana" },
		        { value: "platano", text: "Plátano" }
		      ],
		      es: [
		        { value: "zanahoria", text: "Zanahoria" },
		        { value: "lechuga", text: "Lechuga" }
		      ]
		    };

		const pais = selectPais.value; // obtenemos el valor de la opción seleccionada

		// Limpiar las opciones del segundo select
		selectDeptos.innerHTML = '<option value="" disabled selected>Seleccione</option>';

		if (departamentos[pais]) {
			// Habilitar y agregar opciones al segundo select
			selectDeptos.disabled = false;
	
			for (let i = 0; i < departamentos[pais].length; i++) {
				const opcion = departamentos[pais][i];
				const nuevaOpcion = document.createElement("option");
				nuevaOpcion.value = opcion.value;
				nuevaOpcion.textContent = opcion.text;
				selectDeptos.appendChild(nuevaOpcion);
			}
		} else {
		      selectDeptos.disabled = true;
		    }
		}
	
	
}



let registrarEmpleadoModal = document.querySelector("#registrarEmpleadoModal");
let selectPais = document.querySelector("#selectPais");
let selectDeptos = document.querySelector("#selectDeptos"); 


let action = new Action();

registrarEmpleadoModal.addEventListener("click", action.showModal.bind(action, registrarEmpleadoModal));
selectPais.addEventListener("change", action.departamentosHN.bind(action, selectPais, selectDeptos));



