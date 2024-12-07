//Obtener del DOM a las columnas en donde se insertarán los checkboxes de categorías de productos.
let categoriesCheckboxesCols = document.querySelectorAll(".categoriesCheckboxCol");

//Poblar las columnas con las categorías traídas desde el backend.
ActionGetCatalogsInformation.getProductCategoriesCatalog(categoriesCheckboxesCols);

//Obtener del DOM todos los campos a ser validados
let nombreComercialInput = document.querySelector("#nombreComercialInput");
let marcaSelect = document.querySelector("#marcaSelect");
let tipoSelect = document.querySelector("#tipoSelect");
let cantidadDeContenidoInput = document.querySelector("#cantidadDeContenidoInput");
let unidadDeMedidaInput = document.querySelector("#unidadDeMedidaInput");

//Poblar los selects de marca y tipo.
ActionGetCatalogsInformation.getBranchAndTypeCatalogsInformation(marcaSelect,tipoSelect);

//Añadir el eventListener de change al tipo select para poblar el input de la unidad de medida con la unidad de medida correspondiente al tipo seleccionado.
tipoSelect.addEventListener("change",ActionGetCatalogsInformation.getMeasurementUnit.bind(null,tipoSelect,unidadDeMedidaInput));

//Crear un arreglo con los objetos del DOM a ser validados antes de ser enviados al backend
let inputsToValidate = [nombreComercialInput,marcaSelect,tipoSelect,cantidadDeContenidoInput,unidadDeMedidaInput];

//Botón que desencadena la acción de validar y enviar los datos.
let sendButton = document.querySelector("#sendButton");

//Agregar el eventListener de clic al botón que envía los datos al backend
sendButton.addEventListener("click", ActionRegisterProduct.sendProductInformation.bind(null,inputsToValidate));