
class ActionLogin{
	

	 /**
	* Procesa la respuesta que recibe de un servlet
	* @author 
	* @version 0.1.0
	* @date 2024/07/01
	* @since 2024/07/4
	*/
	
	static processResponse( xhr) {
			
				
		
		
		if(xhr.readyState == XMLHttpRequest.DONE && (xhr.status >= 200 && xhr.status <300)  ){
			
		 console.log("respuesta");
		 }
	       
	    
	}


		 /**
	   * Crea una peticion y la envia a un servlet
	   * @author jose.ineztrosa@unah.edu.hn
	   * @version 0.1.0
	   * @date 2024/07/01
	   * @since 2024/07/4
	   */
		
		static send(email,password){
			
			
			console.log(emailInput.value,passwordInput.value);
			
			let params = [email,password];
		/*	
		ActionRegister. clearInputAnTextarea(inputs);
		let params = ActionRegister.getUrltaData(inputs);
		let value = A[]ionRegister.getDataValue(inputs);
		 let correctParam = `${this.procesParam.isCorrectParam(inputs)}`.split(",");
		 */
		
			let xhr = new XMLHttpRequest();
			xhr.open("POST","users/login");
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.addEventListener("readystatechange",ActionLogin.processResponse.bind(xhr));
			xhr.send(params);
			
			}
	
	
	
} 
