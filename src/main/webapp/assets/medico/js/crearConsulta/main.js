let action = new ActionConsulta();

//parametros
let lblNombreDoctor = document.querySelector("#nombreDoctor");

//sacamos todos los parametros de ingreso
let paciente = document.querySelector("#paciente");
let fecha = document.querySelector("#fecha");
let hora = document.querySelector("#hora");
let costo = document.querySelector("#moneyInput");

let arrayParametros = [paciente, fecha, hora, costo];


//carga los nombres los pacientes asociados al id del doctor guardado en una sesion 
action.loadCargarPacientes(paciente,  lblNombreDoctor);

//evento de registrar consulta
let btnRegistrar = document.querySelector("#btnRegistrarConsulta");
btnRegistrar.addEventListener("click", action.registrarConsulta.bind(action, arrayParametros));
