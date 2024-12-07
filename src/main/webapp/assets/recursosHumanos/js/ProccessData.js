/**
	* Procesa los datos ingresados en el formulario
	* @author agblandin@unah.hn
	* @version 0.1.0
	* @date 2024/11/20
	* @since 2024/11/20
	* @returns retorna un arreglo con el nombre y valor de cada campo
	*/
class ProccessData {


	/**
			* Se encarga de verificar si los valores en el formulario son correctos
			* @author jose.ineztrosa@unah.edu.hn
			* @version 0.1.0
			* @date 2024/11/20
			* @since 2024/11/20
			* @param {HTMLDivElement} persona conjunto de inputs donde ingreso los datos de la persona
			* @param {HTMLDivElement} direccionPersona conjunto de inputs donde ingreso los datos de la direccion de la persona
			* @param {HTMLDivElement} expediente conjunto de inputs donde ingreso los datos de la persona
			* @param {HTMLDivElement} modalError Modal que se muestra si los datos no son correctos
			*/
	load(persona, direccionPersona, salario, deptosh, cargos, fechaIngreso, email, horario, divDoctor, modalError) {

		let modalE = new ErrorToast(modalError);
		let nameT = "titles";

		var titutacionesE = document.querySelectorAll('input[name="optionTitulaciones"]:checked');
		let titulacionOp = [];
		for (let item of titutacionesE) {
			titulacionOp.push(item.value);
		}
/*
		var especializacionD = document.querySelectorAll('input[name="opEspec"]:checked');
		let especilaizaciones = [];
		for (let item of especilaizaciones) {
			especilaizaciones.push(item.value);
		}

		let numeroColegiado = document.querySelector("#numeroColegiado");
*/


		let datatitle =`${nameT}=${titulacionOp}`;

		let empleado = [salario, deptosh, cargos, fechaIngreso, email, horario];

		let personaData = ProccessData.getUrltaData(persona);
		let personaDireccion = ProccessData.getUrltaData(direccionPersona);
		let empleadoData = ProccessData.getUrltaData(empleado);



		let statusNull = ProccessData.isNullData(persona);
		let statusNullD = ProccessData.isNullData(direccionPersona);
		let statusNullEmpleado = ProccessData.isNullData(empleado);
		let statusNullTit = ProccessData.isNullData(titutacionesE);

		


		if (statusNull[0] === false && statusNull[1] === false && statusNull[3] === false && statusNull[5] === false && statusNull[6] === false) {

			if (statusNullD[0] === false && statusNullD[1] === false && statusNullD[2] === false && statusNullD[3] === false && statusNullD[4] === false) {

				if (statusNullEmpleado[0] === false && statusNullEmpleado[1] === false && statusNullEmpleado[2] === false && statusNullEmpleado[3] === false && statusNullEmpleado[4] === false) {


					if (statusNullTit[0] === false) {

						let data = [personaData,personaDireccion,empleadoData,datatitle].join("&");
						Action.send(data, modalError);


					} else {
						modalE.show("Debe elejir almenos una titulacion");
					}

				} else {
					modalE.show("Campos de empleado vacios");
				}
			} else {
				modalE.show("Debe elejir una direccion");
			}
		} else {
			console.log(modalError);
			modalE.show("campos en datos personales vacios");

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
	static getUrltaData(inputs) {
		let data = [];
		for (let item of inputs) {
			data.push(`${item.name}=${Validator.clear(item.value)}`);
		}
		return data.join("&");
	}

	/**
		* Crea un arreglo con boolean al verificar si los campos estan vacios
		* @author agblandin@unha.hn
		* @version 0.1.0
		* @date 2024/11/20
		* @since 2024/11/20
		* @returns retorna una arreglo con booleanos   
		* @param {HTMLDivElement} inputs  conjusnto de inputs donde ingreso los datos
		*/

	static isNullData(inputs) {
		let data = [];
		for (let item of inputs) {
			data.push(Validator.isNull(item.value));
		}
		return data;
	}
}
			
	
