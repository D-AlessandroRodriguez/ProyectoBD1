	//Obtener el parámetro del script actual
	//const currentScriptFile = document.currentScript;
	//const recipeOrderId = currentScriptFile.dataset.orderId;

	//Objetos del DOM que se deben actualizar dinámicamente
	//let bodyTableConsultas = document.querySelector("#bodyTableConsultas");
	//Obtener de la base de datos a los productos de la receta
	//ActionConsultas.getConsultas(bodyTableConsultas);

	//Inicialización de DataTable JQuery para la tabla con las consultas
let recipeProductsDataTable = new DataTable("#consultasTable", {
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
				},
				{
					data: 'paciente',
					name: 'paciente',
				},
				{
					data: 'fecha',
					name: 'fecha',
				},
				{
					data: 'Accion',
					name: 'Accion',
					defaultContent: `<a class="link-opacity-50-hover" href="crearDiagnosticos.jsp">Crear 										diagnostico</a>`
				},
				{
					data: 'generarReceta',
					name: 'generarReceta',
					defaultContent: `<a class="link-opacity-50-hover" href="generatorReceta.jsp">generar 										receta</a>`
				},
			],
	    scrollY: "34vh",
	    scrollCollapse: false,
		serverSide: true,
		ajax: {
			url: "/ProyectoBD1/api/GetConsultas",
			type: "POST",
			dataSrc: function (json) {
				return json.data.map(item => JSON.parse(item));
			},
		}
	})