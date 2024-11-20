 
class ProcessData{
	
	
	
	
	send(inputEmail,inputPassword,modalError){
		
		let modalE = new ErrorModal(modalError);
				
		if(!Validator.isNull(inputEmail.value) && !Validator.isNull(inputPassword.value) ){
			
			let email = Validator.clear(inputEmail.value);
			let password = Validator.clear(inputPassword.value);

				
				
			 if(Validator.isEmail(email)){
				 
			
				ActionLogin.send(email,password);
				
			}else{
				
				modalE.show("Correo electronico no valido");
				
			}
			
			
			
		} else{
			
			modalE.show("Ingrese los datos correctos");
			
		}
		
		
		
		
	}
	
	
	
} 
