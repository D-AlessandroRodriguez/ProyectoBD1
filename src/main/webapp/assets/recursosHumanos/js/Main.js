let load = new Load();
let loadData = new LoadData();
let proccess = new ProccessData();
let dataDoctorLoad = new LoadDataDoctor();

//Datos persona
var nombre1 = document.querySelector("#Nombre1");
var nombre2 = document.querySelector("#Nombre2");
var apellido1 = document.querySelector("#Apellido1");
var apellido2 = document.querySelector("#Apellido2");
var DNIPersona = document.querySelector("#DNIPersona");

var fechaNacimiento = document.querySelector("#fechaNacimiento");
var sexoPersona = document.querySelector("#sexoPersona");

//Direccion persona
var pais = document.querySelector("#pais");
var depto = document.querySelector("#depto");
var ciudad = document.querySelector("#ciudad");
var colonia = document.querySelector("#colonia");
var referenciaD = document.querySelector("#referenciaD");
var sexoPersonaSelect = document.querySelector("#sexoPersona");

var titulaciones = document.querySelector("#titulaciones");
var horario = document.querySelector("#horario");
var deptosh = document.querySelector("#deptosh");
var cargos = document.querySelector("#cargos");
var email = document.querySelector("#email");
var salario = document.querySelector("#salario");
var fechaIngreso = document.querySelector("#fechaIngreso");
var divDoctor = document.querySelector("#dataDoctor");


var titulacionesDiv = document.querySelector("#Titulaciones");

load.send(pais,pais);
loadData.send(cargos,cargos);
loadData.send(deptosh,deptosh);
loadData.send(horario,horario);
loadData.send(titulacionesDiv,titulacionesDiv);




var guardarEmpleado = document.querySelector("#guardarEmpleado");
var modalError = document.querySelector("#modalError");

var direccionPersona = [pais,depto,ciudad,colonia,referenciaD];
var persona = [DNIPersona,nombre1,nombre2,apellido1,apellido2,sexoPersona,fechaNacimiento];
         
//var empleado = [persona,salario,deptosh,cargos,fechaIngreso,email,titutacionesEmpleado];

cargos.addEventListener("change",dataDoctorLoad.load.bind(dataDoctorLoad,divDoctor,cargos));

guardarEmpleado.addEventListener("click",proccess.load.bind(proccess,persona,direccionPersona,salario,deptosh,cargos,fechaIngreso,email,horario,divDoctor,modalError));
pais.addEventListener("change", load.send.bind(load,pais,depto));
depto.addEventListener("change", load.send.bind(load,depto,ciudad));
ciudad.addEventListener("change", load.send.bind(load,ciudad,colonia));

