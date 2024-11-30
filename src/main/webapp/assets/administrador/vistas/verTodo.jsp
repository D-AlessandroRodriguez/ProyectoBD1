<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Consultas</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/administrador.css">		
	</head>
	<body>
		<!-- Encabezado de la página -->
		<nav class="navbar fixed-top bg-primary" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">
					<img src="../../login/img/logo-hospital.png" alt="Logo" width="35" height="30" class="d-inline-block align-text-top">
					Hospital San Jesús
					<!-- Botón para activar el menú lateral -->
					<button class="btn btn-primary" id="menuButton">
						<span class="navbar-toggler-icon"></span>
					</button>
				</a>
				<p style="text-align: right; margin-top: 2vh; margin-right: 1vw; color: white;">Administrador</p>
			</div>
		</nav>

		<!-- Menú lateral -->
		<div class="menuLateral" id="menuLateral">
		    <a href="administrador.jsp">Inicio</a>
			
			<div class="btn-group dropend btn-dark">
			    <a class="btn btn-light-bg-subtle dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    Usuarios
			    </a>
			    <ul class="dropdown-menu dropdown-menu-dark">
				    <li><a class="dropdown-item" href="medicos.jsp">Médicos</a></li>
				    <li><a class="dropdown-item" href="otros.jsp">Otros</a></li>
	  			</ul>
  			</div>
			
		    <a href="pacientes.jsp">Pacientes</a>
		    
		    <div class="btn-group dropend btn-dark">
			    <a class="btn btn-light-bg-subtle dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    Consultas
			    </a>
			    <ul class="dropdown-menu dropdown-menu-dark">
				    <li><a class="dropdown-item" href="#">Ver todo</a></li>
				    <li><a class="dropdown-item" href="crearNuevo.jsp">Crear nuevo</a></li>
	  			</ul>
  			</div>
		    
		    <a href="#">Expedientes</a>
		    <a href="#">Pagos</a>
		    <a href="#">Farmacia</a>
		    <a href="#">Laboratorio</a>
		    <a href="#">Configuración</a>
		    <a href="#">Cerrar sesión</a>
		</div>
		
		<!-- Página principal -->
		<div class="container-fluid" style="margin-left: 16vw; margin-top: 15vh; width:80vw;">
			<div id="infoGeneralRowContainer" class="row">
				<h3 class="pt-3" style="margin-bottom: 2vw;">Próximas consultas</h3>
			</div>
			<div id="tablaRowContainer" class="row overflow-auto">
				<div class="col px-5 mt-1 mb-2">
					<table class="table text-center ">
						<thead class="table-primary" class="encabezadosDeTabla">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Paciente</th>
								<th scope="col">Médico</th>
								<th scope="col">Especialidad</th>
								<th scope="col">Fecha</th>
								<th scope="col">Hora</th>
								<th scope="col">Costo</th>
							</tr>
						</thead>
						<tbody class="table-info">
							<%
							StringBuilder result = new StringBuilder();
							for (int i = 1; i <= 10; i++) {
								result.append("<tr>");
								result.append("<th scope=\"row\">");
								result.append(String.format("<span id=\"numeroPaciente%sSpan\">%s</span>",i,i));
								result.append("</th>");
								result.append("<td>");
								result.append(String.format("<span id=\"nombrePaciente%sSpan\">Nombre Paciente %s</span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"nombreMedico%sSpan\"> Nombre Medico %s</span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"especialidadSpan\"> Especialidad </span>"));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"fechaSpan\"> Fecha </span>"));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"horaSpan\"> Hora </span>"));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"costoSpan\"> Costo </span>"));
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
		<script src="../js/administrador.js"></script>
	</body>
</html>