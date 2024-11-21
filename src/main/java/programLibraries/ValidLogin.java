package programLibraries;

import jakarta.servlet.http.HttpServletRequest;
import programLibraries.api.Repository;
import programLibraries.api.Validator;

public class ValidLogin {
	
	Repository repository = new Repository();
	
	public String getUser(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email + password);
		
		
		if( !email.isEmpty() && !password.isEmpty()) {
			
			email = Validator.clear(email );
			password = Validator.clear(password);
			
			System.out.println(password);
			if(Validator.isEmail(email)) {
				
			repository.getUser(email);
				
				
			}
		
		}else {
			
			
			
		}
		
		
		
		return null;
	}

}
