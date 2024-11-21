package programLibraries.api;

import programLibraries.SQLDatabaseConnection;

public class Repository {
	
	SQLDatabaseConnection sqlbase = new SQLDatabaseConnection();
	
	public String getUser(String user) {
		sqlbase.getUser(user);
		
		
		return null;
		
	}

}
