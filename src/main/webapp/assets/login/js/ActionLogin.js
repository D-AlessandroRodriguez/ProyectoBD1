
class ActionLogin{
	 /**
	* Procesa la respuesta que recibe de un servlet
	* @author 
	* @version 0.1.0
	* @date 2024/07/01
	* @since 2024/07/4
	*/
	static processResponse() {
		let xhr = this;
		
		if(xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status <400)  ){	
		let JsonResponse = JSON.parse(xhr.responseText);
		console.log(JsonResponse);
			if(JsonResponse.status){
				console.log("flujo correcto hasta aqui");
				window.location.reload();
			}
			
		 } 
	}
		 /**
	   * Crea una peticion y la envia a un servlet
	   * @author jose.ineztrosa@unah.edu.hn
	   * @version 0.1.0
	   * @date 2024/07/01
	   * @since 2024/07/4
	   */	
		static send(params){
		
			let xhr = new XMLHttpRequest();
			xhr.open("POST","/ProyectoBD1/session", true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.addEventListener("readystatechange", ActionLogin.processResponse.bind(xhr));
			xhr.send(params);
		}
} 
