class LocalStorageRR{
	//leer de memoria del navegador
	loadLocalStorage() {
		let string = "";
		if (window.localStorage.getItem("ordenReceta")) {
			return window.localStorage.getItem("ordenReceta");
		}
		return string;
	}
	//guarda en memoria
	saveLocalStorage(jsonElement) {
		let ls = window.localStorage;
		if(window.localStorage.getItem("ordenReceta")){
			let arrayElement = JSON.parse(window.localStorage.getItem("ordenReceta"));
			arrayElement.push(jsonElement);
			ls.setItem("ordenReceta", JSON.stringify(arrayElement));	            
		}else{
			let arrayElement =[];
			arrayElement.push(jsonElement);
			ls.setItem("ordenReceta", JSON.stringify(arrayElement));	            
		}
	 }
	//elimina de memoria
	removeLocalStorage(){		
		window.localStorage.removeItem("ordenReceta");
	}
	//verifica si existe en memoria un elemento con nombre ordenReceta
	isGetLocalStorage(){
		if(window.localStorage.getItem("ordenReceta")){
			return true;
		}
		return false;
	}
}