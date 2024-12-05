package programLibraries;

import DAO.LoadPaisesDAO;

/**
 * Obtiene los paises para guaradados en la base
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/08/15
 * @since 2024/08/15
 * */
public class LoadP {
	
	private LoadPaisesDAO paises = new LoadPaisesDAO() ;
	
	public String load() {
		
		
	return	this.paises.loadPaises();		
		
		
	}
	

}
