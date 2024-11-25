const process = new ProcessData();

let emailInput = document.querySelector("#emailInput");
let passwordInput = document.querySelector("#passwordInput");
let buttonSend = document.querySelector("#buttonSend");
let modalError = document.querySelector("#modalError");

buttonSend.addEventListener("click", process.send.bind(process, emailInput, passwordInput, modalError));