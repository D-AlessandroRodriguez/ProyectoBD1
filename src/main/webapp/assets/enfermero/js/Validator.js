
/**
   * Valida diferentes parametros
   * @author agblandin@unah.hn
   * @version 0.1.0
   * @date 2024/08/07
   * @since 2024/08/4
   */
class Validator {

	/**
	   * Verifica si un parametro esta vacio
	   * @author agblandin@unah.hn
	   * @version 0.1.0
	   * @date 2024/08/07
	   * @since 2024/08/4
	   * @param {String} es el parametro que se envia para ser validado
	   */
	static isNull(value) {

		return `${value}`.trim().length === 0 || value === null;


	}

	/**
		   * Verifica si un parametro es un correo
		   * @author jose.ineztrosa@unah.edu.hn,agblandin@unah.hn
		   * @version 0.1.0
		   * @date 2024/08/07
		   * @since 2024/08/4
		   * @param {String} email una cadena que se verifica
		   */
	static isEmail(email) {
		if (`${email}`.match(/^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/)) {
			return true;
		}
		return false;
	}


	/** 
	  * Elimima  el contenido no valido del valor de los paramtros
	  * @author jose.ineztrosa@unah.edu.hn,agblandin@unah.hn
	  * @version 0.1.0
	  * @date 2024/08/07
	  * @since 2024/08/4
	  * @param {String} text es la cadena que se verifica
	  */
	static clear(text) {

		text = `${text}`;
		text = text.replace(/(<[!\/]?\w*(\s\w+(=["`][^"`]*["`])?)*\s?>|([`";]+))/, "");
		text = text.replace(/\b(select|drop|insert|delete|update|where|table|from)\b|['";\\-]/gi, "");
		return text;

	}





} 
