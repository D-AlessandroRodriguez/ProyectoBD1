 
class ProcessData {
	
	send(inputEmail,inputPassword,modalError) {
		
		let modalE = new ErrorToast(modalError);
				
		if (!Validator.isNull(inputEmail.value) && !Validator.isNull(inputPassword.value)) {
			 if(Validator.isEmail(inputEmail.value)){
				
				let params = [inputEmail,inputPassword];	
				let data = this.getUrlData(params);
				ActionLogin.send(data);			
			} else {
				
				modalE.show("Correo electrónico no válido");
			}
		} else {
			
			modalE.show("Llene todos los campos");
		}
	}
	
	getUrlData(inputs) {
		
		let data = [];
		for (let item of inputs) {
			
			data.push(`${item.name}=${Validator.clear(item.value)}`);
		}
		return data.join("&");
	}
}