<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ver Recetas: Farmacia</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/viewRecipeOrdersStyle.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.min.css">
	</head>
	<body>
		<!-- Menú de navegación -->
		<nav class="navbar sticky-top bg-primary navbar-expand-lg" style="height: 10vh;" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">
					<img src="../img/logo-hospital.png" alt="Logo" width="35px" height="30px" class="d-inline-block align-text-top">
					Hospital San Jesús
				</a>
				<div class="vr mx-1" style="color: white; width: 3px;"></div>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
				<div class="collapse navbar-collapse mx-2" id="navbarNavDropdown">
			      <ul class="navbar-nav d-flex gap-2">
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Ver
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item active" id="verOrdenesRecetasMenu" href="#">Órdenes de recetas</a></li>
			            <li><a class="dropdown-item" id="verProductosMenu" href="viewProductos.jsp">Productos</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Registrar
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="registrarProductosMenu" href="viewRegistrarProducto.jsp">Productos</a></li>
			            <li><a class="dropdown-item" id="registrarLotesMenu" href="viewRegistrarLote.jsp">Lotes de Productos</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Otros
			          </a>
			          <ul class="dropdown-menu">
			          	<li><a class="dropdown-item" id="registrarEntradaExtraordinariaMenu" href="viewRegistrarEntradaExtra.jsp">Registrar entrada extraordinaria</a></li>
			            <li><a class="dropdown-item" id="registrarSalidaExtraordinariaMenu" href="viewRegistrarSalidaExtra.jsp">Registrar salida extraordinaria</a></li>
			            <li><a class="dropdown-item" id="verHistorialEntradasSalidasMenu" href="viewEntradasSalidas.jsp">Ver historial de entradas y salidas</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    <div>
			    	<ol class="breadcrumb mb-0">
			    		<li class="breadcrumb-item"><a class="link-light" href="mainViewFarmacia.jsp">Farmacia</a></li>
			    		<li class="breadcrumb-item active" aria-current="page">Órdenes de Recetas</li>
			    	</ol>
			    </div>
			</div>
		</nav>
		<!-- Página principal -->
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row">
				<h3 class="pt-3">Órdenes de Recetas</h3>
			</div>
			<div id="tablaRowContainer" class="row">
				<div class="col px-5 mt-1 mb-2">
					<table id="recipeOrdersTable" class="table table-hover">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Paciente</th>
								<th scope="col">Médico</th>
								<th scope="col">Fecha</th>
								<th scope="col">Acción</th>
							</tr>
						</thead>
						<tbody>
<!-- 							<tr> -->
<!-- 								<th scope="row"> -->
<!-- 									<span id="numeroReceta1Span">1</span> -->
<!-- 								</th> -->
<!-- 						        <td> -->
<!-- 						        	<span id="primerNombrePacienteReceta1Span">Jesús</span> <span id="primerApellidoPacienteReceta1Span">Zepeda</span> -->
<!-- 						        </td> -->
<!-- 						        <td> -->
<!-- 						        	<span id="primerNombreMedicoReceta1Span">Cesar</span> <span id="primerApellidoMedicoReceta1Span">Cruz</span> -->
<!-- 						        </td> -->
<!-- 						        <td> -->
<!-- 						        	<span id="fechaReceta1Span">2024-11-19</span> -->
<!-- 						        </td> -->
<!-- 						        <td> -->
<!-- 						        	<button type="button" class="btn btn-success w-75" id="verReceta1Button">Ver</button> -->
<!-- 						        </td> -->
<!-- 						    </tr> -->
							<%
							StringBuilder result = new StringBuilder();
							for (int i = 1; i <= 15; i++) {
								result.append("<tr>");
								result.append("<th scope=\"row\">");
								result.append(String.format("<span id=\"numeroReceta%sSpan\">%s</span>",i,i));
								result.append("</th>");
								result.append("<td>");
								result.append(String.format("<span id=\"primerNombrePacienteReceta%sSpan\">Jesús</span> <span id=\"primerApellidoPacienteReceta%sSpan\">Zepeda</span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"primerNombreMedicoReceta%sSpan\">Cesar</span> <span id=\"primerApellidoMedicoReceta%sSpan\">Cruz</span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"fechaReceta%sSpan\">2024-11-19</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<a class=\"link-opacity-50-hover\" href=\"viewIndividualRecipeOrder.jsp?ord=%s\">Ver</a>",i));
								result.append("</td>");
								result.append("</tr>");
							}
							out.print(result.toString());
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.min.js"></script>
		<script> 
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
		</script>
	</body>
</html>