  /**
   * Crea una ventan que muestra un error 
   * @author jose.ineztrosa@unah.edu.hn,agblandin@unah.hn
   * @version 0.1.0
   * @date 2024/08/07
   * @since 2024/08/4
   */
class ErrorToast{
	constructor(modalToast){
		this.modalToast=modalToast;
		
	}
  /**
   * Genera la venta de que mustra un error
   * @author jose.ineztrosa@unah.edu.hn,agblandin@unah.hn
   * @version 0.1.0
   * @date 2024/08/07
   * @since 2024/08/4
   * @param {String} message es el mensaje que se mostrara en la ventana
   */
	show(message){
		const text = this.modalToast.querySelector("#textError");
		text.textContent=message;
		const toast = new bootstrap.Toast(this.modalToast);
		toast.show();
	}
}