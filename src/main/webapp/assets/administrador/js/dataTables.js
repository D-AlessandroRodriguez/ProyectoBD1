//           TABLA DE EMPLEADOS
let table = new DataTable('#employeesTable', {
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
			name: 'id'
		},
		{
			data: 'nombre1',
			name: 'nombre1'
		},
		{
			data: 'apellido1',
			name: 'apellido1'
		},
		{
			data: 'departamento',
			name: 'departamento'
		},
		{
			data: 'cargo',
			name: 'cargo'
		},
		{
			data: 'usuario',
			name: 'usuario'
		},
		{
			data: 'perfil',
			name: 'perfil',
			render: function(data) {
				return `<a class="link-opacity-50-hover" href="perfilMedico.jsp?perfil=${data}">Ver orden</a>`;
			}
		}
	],
    scrollY: "55vh",
    scrollCollapse: false,
	serverSide: true,
	ajax: {
		url: "/ProyectoBD1/api/GetEmployees",
		type: "POST"
		//dataSrc: 'data'
	}
});



