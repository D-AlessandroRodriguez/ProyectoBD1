//extraccion de informacion 
let nameDoctor = document.querySelector("#nombreDoctor");
let paciente = document.querySelector("#");

let recipeProductsDataTable = new DataTable('#consultasTable', {
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
				data: 'numero de consulta',
				name: 'numero de consulta',
			},
			{
				data: 'nombre paciente',
				name: 'nombre paciente',
			},
			{
				data: 'fecha',
				name: 'fecha',
			},
			{
				data: 'action',
				name: 'action',
				render: function(data) {
					return `<a class="link-opacity-50-hover" href="viewIndividualRecipeOrder.jsp?ord=${data}">Ver consulta</a>`;
				}
			},
			{
				data: 'dosis',
				name: 'dosis',
				render: function(data) {
					return `<a class="link-opacity-50-hover" href="viewIndividualRecipeOrder.jsp?ord=${data}">Generar consulta</a>`;
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