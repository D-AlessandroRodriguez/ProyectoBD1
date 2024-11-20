 
class ProcessData{
	
	
	
	send(inputEmail,inputPassword){
		
		let email = Validator.clear(inputEmail.value);
		let password = Validator.clear(inputPassword.value);
		
		
		console.log(email);
		console.log(password);
		
					
		if(Validator.isNull(email) || Validator.isNull(password) ){
			

				console.log(email);
				console.log(password);
			if(Validator.isEmail(email)){ 
			ActionLogin.send(email,password);
			}
			
			
		}else{
			
			console.log("llene los campos" );
			
		}
		
		
		
		
	}
	
	
	
} 
