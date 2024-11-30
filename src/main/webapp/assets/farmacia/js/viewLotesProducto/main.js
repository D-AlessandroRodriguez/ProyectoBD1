const currentScriptFile = document.currentScript;

const productId = currentScriptFile.dataset.productId;

console.log(productId);

let table = new DataTable('#tablaDeLotes', {
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
			data: 'cantidadIngresada',
			name: 'canitdadIngresada',
		},
		{
			data: 'fechaIngreso',
			name: 'fechaIngreso',
		},
		{
			data: 'fechaElaboracion',
			name: 'fechaElaboracion',
		},
		{
			data: 'fechaVencimiento',
			name: 'fechaVencimiento',
		},
		{
			data: 'cantidadActual',
			name: 'cantidadActual',
		}
	],
    scrollY: "55vh",
    scrollCollapse: false,
	serverSide: true,
	ajax: {
		url: "/ProyectoBD1/api/get_batches",
		type: "POST",
		data: function(d) {
			d.productId = productId;
		}
	}
});