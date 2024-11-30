let btnAction = new ActionBtnVer(); 

let modalView = document.querySelector(".modalViewVer");
let btnVer = document.querySelectorAll(".btnVer");

for(let btn of btnVer){
	btn.addEventListener("click", btnAction.showModalVer.bind(btnAction,modalView));
}