class LimitarDecimales{
	/**
	* metodo para limitar el numero de decimales del input para ingresr el costo de la consulta
	* @author cdcruzr@unah.hn
	* @version 0.2.0
	* @since 2024/12/1
	* @date 2024/12/5
	* @param {Select DOM} selectPacientes elemento html select en donde iran el nombre de todos los pacientes 
	* @param {number}  count el valor para verificar si es correcto con dos numeros decimales
	*/
	static limitDecimalPlaces(event, count) {
		const value = event.target.value;
		if (value.includes(".")) {
			const [integer, decimal] = value.split(".");
			if (decimal.length > count) {
				event.target.value = `${integer}.${decimal.substring(0, count)}`;
			}
		}
	}
}