
var nombre1 = document.querySelector("#Nombre1");
var nombre2 = document.querySelector("#Nombre2");
var apellido1 = document.querySelector("#Apellido1");
var apellido2 = document.querySelector("#Apellido2");
var DNIPersona = document.querySelector("#DNIPersona");
var RTNPersona = document.querySelector("#RTNPersona");
var fechaNacimiento = document.querySelector("#fechaNacimiento");
var sexoPersona = document.querySelector("#sexoPersona");
var tipoSangreP = document.querySelector("#tipoSangreP");
var estadoPersona = document.querySelector("#estadoPersona");

var pais = document.querySelector("#pais");
var depto = document.querySelector("#depto");
var ciudad = document.querySelector("#ciudad");
var colonia = document.querySelector("#colonia");
var referenciaD = document.querySelector("#referenciaD");
let load = new Load();
load.send(pais);

var guardarExpediente = document.querySelector("#buttonCreate");
var modalError = document.querySelector("#modalError");

var persona = [DNIPersona,RTNPersona,nombre1,nombre2,apellido1,apellido2,sexoPersona,fechaNacimiento];
var direccionPersona = [pais,depto,ciudad,colonia,referenciaD];
var expediente = [persona,tipoSangreP,estadoPersona];


guardarExpediente.addEventListener("click",ProcessData.load.bind(Action,persona,direccionPersona,expediente,modalError));


