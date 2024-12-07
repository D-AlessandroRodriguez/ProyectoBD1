
//Obtener del DOM los elementos que deben actualizarse de forma dinámica.
let productsList = document.querySelector("#listaDeProductos");
let productInput = document.querySelector("#identificacionProductoInput");
let productionDateInput = document.querySelector("#fechaElabInput");
let expirationDateInput = document.querySelector("#fechaVencInput");
let batchQuantityInput = document.querySelector("#cantidadProducto");

//Traer del backend a los productos para introducirlos en la lista de productos para que el usuario pueda elegir el producto del cuál se registrará el lote.
ActionGetProducts.getProducts(productsList);

//Botón que permite que el usuario pueda cambiar el producto ya elegido para registrar un lote.
let changeProductButton = document.querySelector("#changeProductButton");

//Agregar un eventListener al input de búsqueda del producto
productInput.addEventListener("change", ActionSetProduct.setProductToRegisterBatch.bind(productInput,changeProductButton));

//Agregar un eventListener clic al botón de cambiar producto para limpiar la caja de texto del producto.
changeProductButton.addEventListener("click", ActionSetProduct.changeProduct.bind(changeProductButton,productInput));

//Botón que desencadena el envío de los datos para el registro de un lote de un producto en la base de datos.
let sendButton = document.querySelector("button[type='submit']");

//Arreglo de los inputs para registrar el lote.
let dataInputs = [productInput,productionDateInput,expirationDateInput,batchQuantityInput];

//Agregar un eventListener clic al botón para que se envíen los datos al backend para el registro de un lote de producto.
sendButton.addEventListener("click", ActionRegisterBatch.registerBatch.bind(null,dataInputs));