
class Action {
	
	constructor(menu){
		this.menu = menu;
	}
	
	showOrHide (clickEvent){
		this.menu.classList.toggle('active');
	}
	
}




// Activar y desactivar el menú lateral
let menuButton = document.querySelector("#menuButton");
let menu = document.querySelector("#menuLateral");
let action = new Action(menu);

menuButton.addEventListener("click", action.showOrHide.bind(action));