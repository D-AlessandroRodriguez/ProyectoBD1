let table = new DataTable('#recipeOrdersTable', {
	paging: true,
	pageLength: 15,
    lengthMenu: [15, 30, 50, 100],
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
			data: 'medico',
			name: 'medico',
		},
		{
			data: 'fecha',
			name: 'fecha',
		},
		{
			data: 'accion',
			name: 'accion',
			render: function(data) {
				return `<a class="link-opacity-50-hover" href="viewIndividualRecipeOrder.jsp?ord=${data}">Ver orden</a>`;
			}
		},
	],
    scrollY: "55vh",
    scrollCollapse: false,
	serverSide: true,
	ajax: {
		url: "/ProyectoBD1/api/get_recipe_orders",
		type: "POST"
	}
});