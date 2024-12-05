
class Action {
	
	constructor(menu){
		this.menu = menu;
	}
	
	showOrHide (clickEvent){
		this.menu.classList.toggle('active');
	}
	
	
}




let menuButton = document.querySelector("#menuButton");
let menu = document.querySelector("#menuLateral");
let action = new Action(menu);

//Mostrar/ocultar el menú lateral 
menuButton.addEventListener("click", action.showOrHide.bind(action));
