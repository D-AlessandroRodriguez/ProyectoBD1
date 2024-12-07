package services;
/**
 * Crea un horario 
 * @author agblandin@unah.hn
 * @version 0.1.0
 * @date 2024/11/28
 * @since 2024/11/28
 */
public class Horario {
	
	private static  int id ;
	/**
	 *  @return retorna el id asociado al horario
	 */
	public static int getId() {
		return id;
	}
	/**
	 * Establece un nuevo id al horario
	 *  @param value es el nuevo valor del id
	 */
	public static void setId(int value) {
		id = value;
	}
	

}
