let action = new ActionConsulta();

//parametros
let lblNombreDoctor = document.querySelector("#nombreDoctor");

let paciente = document.querySelector("#paciente");
let fecha = document.querySelector("#fecha");
let hora = document.querySelector("#hora");
let costo = document.querySelector("#costo");

let arrayParametros = [paciente, fecha, hora, costo];
//cargar pacientes

action.loadCargarPacientes.bind(action, paciente,  lblNombreDoctor);

//evento de registrar consulta
let btnRegistrar = document.querySelector("#btnRegistrarConsulta");
btnRegistrar.addEventListener("click", action.registrarConsulta.bind(action, arrayParametros));
