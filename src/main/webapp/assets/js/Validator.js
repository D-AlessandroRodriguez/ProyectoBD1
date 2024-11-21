class Validator{
	
	static isNull(value){

	return `${value}`.trim().length === 0  || value === null;
	

	}
	
	static isEmail(email) {
	       if(`${email}`.match(/^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/)){
	           return true;
	       }
	       return false;
	   }

	   static clear(text){
	   	
	   	text = `${text}`;
	   	text = text.replace(/(<[!\/]?\w*(\s\w+(=["`][^"`]*["`])?)*\s?>|([`";]+))/,"");
	   	text = text.replace(/\b(select|drop|insert|delete|update|where|table|from)\b|['";\\-]/gi,"");
	   	return text;

	   }
	   
	  
	   
	
	
} 
