<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ver: Consultas</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/viewInteractionMedico-style.css">
	</head>
	<body>
		<!-- Menú de navegación -->
		<nav class="navbar sticky-top bg-primary navbar-expand-lg" style="height: 10vh;" data-bs-theme="dark">
	<div class="container-fluid">
				<a class="navbar-brand" href="viewMedico.jsp">
					<img src="../img/logo-hospital.png" alt="Logo" width="35px" height="30px" class="d-inline-block align-text-top">
					Hospital San Jesús
				</a>
				<!--hr vertical de boostrap-->
				<div class="vr mx-1" style="color: white; width: 3px;"></div>
				<!--  no se para que-->
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon">botones</span>
			    </button>
			    <!-- nav para tener dentro los botones para interactuar -->
				<div class="collapse navbar-collapse mx-2" id="navbarNavDropdown">
			      <ul class="navbar-nav d-flex gap-2">
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Generar
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="verOrdenesRecetasMenu" href="generatorReceta.jsp">Receta</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Nuevo
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="crearCosulta" href="crearConsulta.jsp">Crear consulta</a></li>
			            <li><a class="dropdown-item" id="crearDiagnostico" href="crearDiagnosticos">Crear diagnostico</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Existente
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="verConsultas" href="verConsultasMedico.jsp">Ver consultas del medico</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    	<ol class="breadcrumb mb-0">
			    		<li class="breadcrumb-item"><a class="link-light" href="viewMedico.jsp">Medico</a></li>
			    		<li class="breadcrumb-item active" aria-current="page">Crear consulta</li>
			    	</ol>
			    </div>
		</nav>
		<!-- Página principal -->
		<div class="modal modalViewVer" tabindex="-1">
				<div class="modal-dialog modal-xl">
			      <div class="modal-content">
			        <div class="modal-header">
			          <h5 id="title" class="modal-title">Paciente: Jesús Zepeda</h5>
			          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			        </div>
			        <div class="modal-body">
			            <div id="bodyModalVer"  class="ratio" style="--bs-aspect-ratio: 0; margin:10px"></div>
			        	<!--valores dentro del cuerpo -->
					<table class="table">
						<thead>
							<tr>
								<th scope="col">fecha: 2024/11/27</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">Diagnostico</th>
							</tr>
							<tr>
								<td>
									hello world
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			        <div class="modal-footer">
			          <button type="button" id="exitModal" class="btn btn-secondary" data-bs-dismiss="modal">Salir</button>
			        </div>
			      </div>
			  </div>
		  </div>
		
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row">
				<h3 class="pt-3">Consultas por el <span id="nameDoctor">Dr. Cesar Cruz</span></h3>
			</div>
			<div id="tablaRowContainer" class="row overflow-auto">
				<div class="col px-5 mt-1 mb-2">
					<table class="table table-hover text-center">
						<thead id="encabezadosDeTabla">
							<tr>
								<th scope="col">Numero consulta</th>
								<th scope="col">Paciente</th>
								<th scope="col">Fecha</th>
								<th scope="col">Acción</th>
							</tr>
						</thead>
						<tbody>
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
								result.append(String.format("<span id=\"fechaReceta%sSpan\">2024-11-19</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<button class=\"btn btnVer btn-primary\" type=\"button\">Ver</button>",i));
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
		<div id="pieContenedor" class="container">
			<nav class="p-2">
				<ul class="pagination justify-content-center mb-0">
			    	<li class="page-item disabled">
			        	<a class="page-link">Anterior</a>
			    	</li>
			    	<li class="page-item active" aria-current="page">
			      		<a class="page-link" href="#">1</a>
			    	</li>
			    	<li class="page-item"><a class="page-link" href="#">2</a></li>
			    	<li class="page-item"><a class="page-link" href="#">3</a></li>
			    	<li class="page-item">
			      		<a class="page-link" href="#">Siguiente</a>
			    	</li>
			  	</ul>
			</nav>
		</div>
		
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../js/ActionBtnVer.js"></script>
		<script src="../js/mainBtnVer.js"></script>
	</body>
</html>