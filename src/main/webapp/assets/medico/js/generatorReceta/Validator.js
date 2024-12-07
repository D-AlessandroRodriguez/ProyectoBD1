	/**
	* clase que valida los parametros para ingresar una receta de productos
	* @author cdcruzr@unah.hn
	* @version 0.1.0
	* @since 2024/11/27
	* @date 2024/11/30
	*/
class Validator{	
	static ParametrosVacios(jsonElement){
		for (let key of Object.keys(jsonElement)) {
			if (jsonElement[key] == null || jsonElement[key] == "Seleccione el producto" || jsonElement[key] == '' ||
				jsonElement[key] == "Seleccione la marca" || jsonElement[key] == "Selecciona"){
				return false;
			}
		}
		return true;
	}
}