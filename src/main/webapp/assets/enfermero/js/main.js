let load = new Load();
let dataLoad = new LoadData();

var nombre1 = document.querySelector("#Nombre1");
var nombre2 = document.querySelector("#Nombre2");
var apellido1 = document.querySelector("#Apellido1");
var apellido2 = document.querySelector("#Apellido2");
var DNIPersona = document.querySelector("#DNIPersona");
var RTNPersona = document.querySelector("#RTNPersona");
var fechaNacimiento = document.querySelector("#fechaNacimiento");
var sexoPersona = document.querySelector("#sexoPersona");
var TiposDeSangre = document.querySelector("#TiposDeSangre");
var EstadosPaciente = document.querySelector("#EstadosPaciente");
var telefonoEmergencia = document.querySelector("#telefonoEmergencia");

var pais = document.querySelector("#pais");
var depto = document.querySelector("#depto");
var ciudad = document.querySelector("#ciudad");
var colonia = document.querySelector("#colonia");
var referenciaD = document.querySelector("#referenciaD");
var defaultoptiondefaultoption = document.querySelector("#defaultoption");

var sexoPersonaSelect = document.querySelector("#sexoPersona");


dataLoad.send(TiposDeSangre);


dataLoad.send(EstadosPaciente);


load.send(pais,pais);


var guardarExpediente = document.querySelector("#buttonCreate");
var modalError = document.querySelector("#modalError");

var direccionPersona = [pais,depto,ciudad,colonia,referenciaD];
var persona = [DNIPersona,RTNPersona,nombre1,nombre2,apellido1,apellido2,sexoPersona,fechaNacimiento];
var expedientedata = [TiposDeSangre,EstadosPaciente,telefonoEmergencia];


guardarExpediente.addEventListener("click",ProcessData.load.bind(Action,persona,direccionPersona,expedientedata,modalError));
pais.addEventListener("change", load.send.bind(load,pais,depto));
depto.addEventListener("change", load.send.bind(load,depto,ciudad));
ciudad.addEventListener("change", load.send.bind(load,ciudad,colonia));

