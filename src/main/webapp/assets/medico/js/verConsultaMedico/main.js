//extraccion de informacion 
let nameDoctor = document.querySelector("#nombreDoctor");

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
				data: 'Numero consulta',
			},
			{
				data: 'Fecha',
			},
			{
				data: 'Nombre Paciente',
			},
			{
				data: 'Accion',
				render: function(data) {
					return `<a class="link-opacity-50-hover" href="crearDiagnosticos.jsp?ord=${data}">Ver consulta</a>`;
				}
			},
			{
				data: 'Generar receta',
				render: function(data) {
					return `<a class="link-opacity-50-hover" href="generatorReceta.jsp?ord=${data}">Generar receta</a>`;
				}
			}
		],
	scrollY: "55vh",
	scrollCollapse: false,
	serverSide: true,
	ajax: {
		url: "/ProyectoBD1/api/getConsultas",
		type: "POST"
	}
});