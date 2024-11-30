//Obtener el parámetro del script actual
const currentScriptFile = document.currentScript;
const recipeOrderId = currentScriptFile.dataset.orderId;

//Objetos del DOM que se deben actualizar dinámicamente
let nombrePacienteSpan = document.querySelector("#nombrePacienteRecetaSpan");
let nombreMedicoSpan = document.querySelector("#nombreMedicoRecetaSpan");
let fechaRecetaSpan = document.querySelector("#fechaRecetaSpan");
let productosDeRecetaTbody = document.querySelector("#productosDeRecetaTbody");

//Botón para mostrar ventana modal con los productos a entregar y los faltantes.
let productosDisponiblesButton = document.querySelector("#productosDisponiblesButton");

//Ventana modal para ver los productos disponibles para entregar y los faltantes.
let productosDisponiblesModal = document.querySelector("#productosDisponiblesModal");

//Botón para confirmar la entrega de los productos disponibles para entregar.
let entregarProductosDisponiblesButton = document.querySelector("#entregarProductosDisponiblesButton");

//Obtener de la base de datos a los productos de la receta
ActionGetRecipeProducts.getRecipeProducts(recipeOrderId,productosDeRecetaTbody);

//Escuchador de evento clic sobre el botón que permite ver los productos disponibles y no disponibles.
productosDisponiblesButton.addEventListener("click", ActionGetAvailableProducts.getAvailableProducts.bind(null,recipeOrderId,productosDisponiblesModal));

//Inicialización de DataTable JQuery para la tabla con los productos de la receta.
let recipeProductsDataTable = new DataTable('#productosDeRecetaTable', {
	paging: false,
	pageLength: 10,
    lengthMenu: [10,20],
    language: {
        paginate: {
          first: "Primera",
          last: "Última",
          next: "Siguiente",
          previous: "Anterior",
        },
        info: "Mostrando _START_ a _END_ de _TOTAL_ registros",
        lengthMenu: "Mostrar _MENU_ registros",
        search: "Buscar:"
    },
	columns : [
			{
				data: 'id',
				name: 'id',
				render: function(data) {
					return `<p style="text-align: center; margin-bottom: 0;">${data}</p>`;
				}
			},
			{
				data: 'nombre',
				name: 'nombre',
			},
			{
				data: 'marca',
				name: 'marca',
			},
			{
				data: 'tipo',
				name: 'tipo',
			},
			{
				data: 'cantidad',
				name: 'cantidad',
				render: function(data) {
					return `<p style="text-align: center; margin-bottom: 0;">${data}</p>`;
				}
			},
			{
				data: 'dosis',
				name: 'dosis',
			}
		],
    scrollY: "34vh",
    scrollCollapse: false
});