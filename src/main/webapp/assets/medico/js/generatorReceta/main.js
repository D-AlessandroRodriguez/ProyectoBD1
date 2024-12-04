let actionGenerarReceta = new ActionGenerarReceta();
let ls = new LocalStorageRR();

//nombre del doctor
let lblNombreDoctor =  document.querySelector("#nombreMedico");

//nombre del paciente o select en donde se mostraran los nombres del paciente
let selectNombrePaciente =  document.querySelector("#nombrePaciente");

//todos los select que refieren al producto
let selectNombreProducto =  document.querySelector("#productoName");
let selectMarca =  document.querySelector("#marca");
let cantProducto=  document.querySelector("#cantProducto");
let docificacion =  document.querySelector("#docificacion");
let frecuencia =  document.querySelector("#frecuencia");
let unidadDeMedida =  document.querySelector("#unidadDeMedida");

let listSelect = [selectNombreProducto, selectMarca, cantProducto, docificacion, frecuencia, unidadDeMedida];

//boton para registrar receta
let bodyTable = document.querySelector("#bodyTable");

	if(ls.isGetLocalStorage()){
		let load = JSON.parse(ls.loadLocalStorage());
		actionGenerarReceta.loadStorage(load, bodyTable);		
	}
// evento click para registrar receta en la tabla
let btnRegistrarReceta = document.querySelector("#btnRegistrarReceta");
btnRegistrarReceta.addEventListener("click", actionGenerarReceta.createLocalStorage.bind(actionGenerarReceta,listSelect, bodyTable));

//cargamos los productos
actionGenerarReceta.cargarProductos(selectNombreProducto);

//para hacer el select de acuerdo al producto
selectNombreProducto.addEventListener("change",
												actionGenerarReceta.actionSendSelect.bind(
													actionGenerarReceta,
													selectMarca,
													selectNombreProducto
										));

//boton para guardar en la base de datos la data	
let btnGuardarReceta = document.querySelector("#btngGuardarReceta");
btnGuardarReceta.addEventListener("click", actionGenerarReceta.insertReceta.bind(actionGenerarReceta));


