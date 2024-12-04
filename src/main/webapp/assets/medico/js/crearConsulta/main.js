let action = new ActionConsulta();

//parametros
let pacienteNombre = document.querySelector("#paciente");
let fecha = document.querySelector("#fecha");
let hora = document.querySelector("#hora");
let costo = document.querySelector("#costo");

let arrayParametros = [pacienteNombre, fecha, hora, costo];

//evento de registrar consulta
let btnRegistrar = document.querySelector("#btnRegistrarConsulta");

btnRegistrar.addEventListener("click", action.registrarConsulta.bind(action, arrayParametros));
