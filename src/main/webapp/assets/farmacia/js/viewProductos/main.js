let table = new DataTable('#productsTable', {
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
			name: 'Id',
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
			data: 'contenido',
			name: 'contenido',
		},
		{
			data: 'stock',
			name: 'stock',
		},
		{
			data: 'accion',
			name: 'accion',
			render: function(data) {
				return `<a class="link-opacity-50-hover" href="viewLotesProducto.jsp?prod=${data}">Ver lotes</a>`;
			}
		},
	],
    scrollY: "55vh",
    scrollCollapse: false,
	serverSide: true,
	ajax: {
		url: "/ProyectoBD1/api/get_products",
		type: "POST"
	}
});