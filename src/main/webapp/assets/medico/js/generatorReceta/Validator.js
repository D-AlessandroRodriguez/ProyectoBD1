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