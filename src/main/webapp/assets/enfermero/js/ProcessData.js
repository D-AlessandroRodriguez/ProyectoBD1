
/**
	* Procesa los datos ingresados en el formulario
	* @author agblandin@unah.hn
	* @version 0.1.0
	* @date 2024/11/20
	* @since 2024/11/20
	* @returns retorna un arreglo con el nombre y valor de cada campo
	*/
class ProcessData {


	/**
			* Se encarga de verificar si los valores en el formulario son correctos
			* @author jose.ineztrosa@unah.edu.hn
			* @version 0.1.0
			* @date 2024/11/20
			* @since 2024/11/20
			* @param {HTMLDivElement}  persona conjusnto de inputs donde ingreso los datos de la persona
			* @param {HTMLDivElement}  direccionPersona conjunto de inputs donde ingreso los datos de la direccion de la  persona
			* @param {HTMLDivElement}  expediente conjunto de inputs donde ingreso los datos de la persona
			* @param {HTMLDivElement}  modalError Modal que se muestra si los datos no son correctos
			*/
	static load(persona, direccionPersona, expediente, modalError) {

		let modalE = new ErrorToast(modalError);

		let personaData = ProcessData.getUrltaData(persona);


		let statusNull = [];


		if (statusNull[0] === false && statusNull[2] === false && statusNull[4] === false && statusNull[6] === false && statusNull[7] === false) {


			Action.send(personaData, modalError);
		} else {
			console.log(modalError);
			modalE.show("llene todos los campos");

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
