let table = new DataTable('#productsMovementsTable', {
	paging: true,
	pageLength: 30,
    lengthMenu: [30, 50, 100, 200],
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
			data: 'producto',
			name: 'producto',
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
			data: 'lote',
			name: 'lote',
		},
		{
			data: 'movimiento',
			name: 'movimiento',
		},
		{
			data: 'cantidad',
			name: 'cantidad',
			render: function(data) {
				return `<p style="text-align: center; margin-bottom: 0;">${data}</p>`;
			}
		},
		{
			data: 'fecha',
			name: 'fecha',
		}
	],
    scrollY: "55vh",
    scrollCollapse: false,
	serverSide: true,
	ajax: {
		url: "/ProyectoBD1/api/get_products_movements",
		type: "POST"
	}
});