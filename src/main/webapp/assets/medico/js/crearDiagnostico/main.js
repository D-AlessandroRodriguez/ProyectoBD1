let actionDiagnostico = new ActionDiagnostico();

//nombre del doctor
let lblNombreDoctor =  document.querySelector("#nombreMedico");
let selectNombrePaciente =  document.querySelector("#nombrePaciente");
//parametro extras
let observaciones = document.querySelector("#observaciones");
let fecha = document.querySelector("#fecha");

//boton para registrar
let btnRegistrarDiagnostico = document.querySelector("#registrarDiagnostico");


actionDiagnostico.loadCargarPacientes(selectNombrePaciente, lblNombreDoctor);
btnRegistrarDiagnostico.addEventListener("click", actionDiagnostico.insertDiagnostico.bind(actionDiagnostico,  observaciones, fecha));