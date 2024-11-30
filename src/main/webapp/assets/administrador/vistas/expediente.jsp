<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pacientes</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/administrador.css">		
		<link rel="stylesheet" href="../css/medicos.css">		
		<link rel="stylesheet" href="../css/expediente.css">
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
				    <li><a class="dropdown-item" href="#">Otros</a></li>
	  			</ul>
  			</div>
  			
		    <a href="pacientes.jsp">Pacientes</a>
		    
		    <div class="btn-group dropend btn-dark">
			    <a class="btn btn-light-bg-subtle dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    Consultas
			    </a>
			    <ul class="dropdown-menu dropdown-menu-dark">
				    <li><a class="dropdown-item" href="verTodo.jsp">Ver todo</a></li>
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
		
		<!-- DATOS GENERALES -->
		<div class="container" style="margin-left: 16vw; margin-top: 15vh; width:80vw;">
			<div class="row align-items-start">
				<div class="col">
					<h3 class="pt-3">Datos generales </h3>
				</div>
				<div class="col" style="text-align: right; margin-top: 2.5vh;">
					<a href="pacientes.jsp" class="btn btn-danger"> Cerrar ventana </a>
				</div>
			</div>
			
			<div id="datosGenerales" class="container" style="margin-top: 2vh; border-radius: 10px; background-color: lightblue;">
				<div class="row align-items-start">
					<div class="col" style="margin-left: 1vw; margin-top:3.5vh;">
						<span> <strong> Nombre(s): </strong> </span> <br>
						<span> María José </span> <br> <br>
						<span> <strong> Apellido(s): </strong> </span> <br>
						<span> López Guerra </span> <br> <br>
						<span> <strong> Fecha de nacimiento: </strong> </span> <br>
						<span> 1980-03-03 </span> <br> <br>
					</div>
					<div class="col" style="margin-top:3.5vh;">
						<span> <strong> DNI: </strong> </span> <br>
						<span> 0801-1980-17210 </span> <br><br>
						<span> <strong> Número de empleado: </strong> </span> <br>
						<span> 20203628 </span> <br><br>
						<span> <strong> Correo(s) electrónico(s): </strong> </span> <br>
						<span> correo1@gmail.com / correo2@gmail.com </span> <br> <br>
					</div>
					<div class="col" style="margin-top:3.5vh;">
						<span> <strong> Teléfono(s): </strong> </span> <br>
						<span> 9999-9999 / 8888-8888 </span> <br> <br>
						<span> <strong> Dirección: </strong> </span> <br>
						<span> Tegucigalpa, La Kennedy, quinta entrada </span> <br> <br>
					</div>
				</div>
				<hr>
				<div class="row align-items-start">
					<div class="col" style="margin-left: 1vw;">
						<span> <strong> Tipo de sangre: </strong> </span>
						<span> O positivo (O+) </span> <br> <br>
					</div>
					<div class="col">
						<span> <strong> Estado: </strong> </span>
						<span> Activo </span> <br> <br>
					</div>
				</div>
			</div>
		</div>
		

						<!-- ANTECEDENTES -->
		
		<div class="container" style="margin-left: 16vw; margin-top: 5vh; margin-bottom:2vh; width:80vw;">
			<div class="row align-items-start">
				<div class="col">
					<h3 class="pt-3">Antecedentes</h3>
				</div>
			</div>
		</div>	
		
		<div id="antecedentes" class="container" style="margin-left: 16vw; width:80vw;">
			<div id="antecedentesRowContainer" class="row overflow-auto">
				<div class="col px-5 mt-1 mb-2">
					<table class="table table-hover text-center">
						<thead id="encabezadosDeTabla">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Patología</th>
								<th scope="col">Categoría</th>
								<th scope="col">Parentesco</th>
								<th scope="col">Medicamentos</th>
							</tr>
						</thead>
						<tbody>	
							<%
							StringBuilder result = new StringBuilder();
							for (int i = 1; i <= 5; i++) {
								result.append("<tr>");
								result.append("<th scope=\"row\">");
								result.append(String.format("<span id=\"numeroPato%sSpan\">%s</span>",i,i));
								result.append("</th>");
								result.append("<td>");
								result.append(String.format("<span id=\"patologia%sSpan\">Patología</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"categoriaPato%sSpan\">Categoría</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"parentesco%sSpan\">Parentesco</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<a class=\"link-opacity-50-hover\" href=\"#\">Ver</a>"));
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
		
		
                                                   <!-- CONSULTAS -->
		
	
		<div class="container" style="margin-left: 16vw; margin-top: 5vh; margin-bottom: 5vh; width:80vw;">
			<div class="row align-items-start">
				<div class="col" style="margin-bottom: 3vh; ">
					<h3 class="pt-3">Consultas</h3>
				</div>
			</div>
			
			
			<div id="consultasBloque" style="height: 90%;" class="container text-center overflow-auto">
				<div id="consulta1" class="row" style=" margin-bottom: 2vh;">
					<div id="numeroConsulta" class="col" style="text-align:center;">
						<strong id="numeroConsulta"> # </strong>
					</div>
					<div id="fecha" class="col" style="text-align:center;">
						<strong id="fecha"> Fecha </strong>
					</div>
					<div id="hora" class="col" style="text-align:center;">
						<strong id="hora"> Hora </strong>
					</div>
					<div id="especialidad" class="col" style="text-align:center;">
						<strong id="especialidad"> Especialidad </strong>
					</div>
					<div id="medico" class="col" style="text-align:center;">
						<strong id="medico"> Médico </strong>
					</div>
					<div id="detalles" class="col" style="text-align:center;">
						<strong id="detalles">Detalles</strong>
					</div>
					<div id="examenes" class="col" style="text-align:center;">
						<strong id="examenes">Exámenes</strong>
					</div>
				</div>
				
				<hr style="height: 3px; background-color: blue; border: none;">
				
				<div id="consulta1" class="row" style=" margin-bottom: 1vh;">
					<div id="numeroConsulta" class="col" style="text-align:center;">
						<strong id="numeroConsulta"> 1 </strong>
					</div>
					<div id="fecha1" class="col" style="text-align:center;">
						<span id="fecha1"> 29-11-2024 </span>
					</div>
					<div id="hora1" class="col" style="text-align:center;">
						<span id="hora1"> 08:30 AM </span>
					</div>
					<div id="especialidad1" class="col" style="text-align:center;">
						<span id="especialidad1"> Medicina general </span>
					</div>
					<div id="medico1" class="col" style="text-align:center;">
						<span id="medico1"> Juan Carlos Medina </span>
					</div>
					<div id="detalles1" class="col" style="text-align:center;">
						<button class="boton" data-target="bloqueContenido1">Ver</button><br>
					</div>
					<div id="examenes1" class="col" style="text-align:center;">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Ver</button><br>
					</div>
				</div>
				<div class="bloque" id="bloqueContenido1" style="text-align:left; margin-bottom: 2vh; background-color: lightblue;">
					<p>El paciente se presentó a la sala de emergencias con fiebre alta, dolor de garganta, y palidez notoria.</p>
				</div>
				
				<hr style="height: 3px; background-color: blue; border: none;">
						
				<div id="consulta2" class="row" style=" margin-bottom: 1vh;">
					<div id="numeroConsulta" class="col" style="text-align:center;">
						<strong id="numeroConsulta"> 2 </strong>
					</div>
					<div id="fecha2" class="col" style="text-align:center;">
						<span id="fecha1"> 29-11-2024 </span>
					</div>
					<div id="hora2" class="col" style="text-align:center;">
						<span id="hora2"> 04:30 PM </span>
					</div>
					<div id="especialidad2" class="col" style="text-align:center;">
						<span id="especialidad2"> Medicina general </span>
					</div>
					<div id="medico2" class="col" style="text-align:center;">
						<span id="medico2"> Juan Carlos Medina </span>
					</div>
					<div id="detalles" class="col" style="text-align:center;">
						<button class="boton" data-target="bloqueContenido2">Ver</button><br>
					</div>
					<div id="examenes2" class="col" style="text-align:center;">
						<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Ver</button><br>
					</div>
				</div>
				<div class="bloque" id="bloqueContenido2" style="text-align:left; margin-bottom: 2vh; background-color: lightblue;">
					<p>El paciente se presenta con malestar estomacal y náuseas, las cuales comenzaron hace dos días.</p>
				</div>
				
				<hr style="height: 3px; background-color: blue; border: none;">
				
				<div id="consulta3" class="row" style=" margin-bottom: 1vh;">
					<div id="numeroConsulta" class="col" style="text-align:center;">
						<strong id="numeroConsulta"> 3 </strong>
					</div>
					<div id="fecha3" class="col" style="text-align:center;">
						<span id="fecha3"> 29-11-2024 </span>
					</div>
					<div id="hora3" class="col" style="text-align:center;">
						<span id="hora3"> 10:30 AM </span>
					</div>
					<div id="especialidad3" class="col" style="text-align:center;">
						<span id="especialidad3"> Medicina general </span>
					</div>
					<div id="medico3" class="col" style="text-align:center;">
						<span id="medico3"> Juan Carlos Medina </span>
					</div>
					<div id="detalles" class="col" style="text-align:center;">
						<button class="boton"  data-target="bloqueContenido3">Ver</button><br>
					</div>
					<div id="examenes3" class="col" style="text-align:center;">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Ver</button><br>
					</div>
				</div>
				<div class="bloque" id="bloqueContenido3" style="text-align:left; margin-bottom: 2vh; background-color: lightblue;">
					<p>Nota del doctor.</p>
				</div>
				<hr style="height: 3px; background-color: blue; border: none;">
			</div>
		</div> 
		
		
		                                  <!-- Modal EXAMENES-->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Exámenes</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		
                                                   <!-- DIAGNÓSTICOS -->
		
	
		<div class="container" style="margin-left: 16vw; margin-top: 5vh; margin-bottom: 5vh; width:80vw;">
			<div class="row align-items-start">
				<div class="col" style="margin-bottom: 3vh; ">
					<h3 class="pt-3">Diagnósticos</h3>
				</div>
			</div>
			
			
			<div id="consultasBloque" style="height: 90%;" class="container text-center overflow-auto">
				<div id="consulta1" class="row" style=" margin-bottom: 2vh;">
					<div id="numeroDiagnostico" class="col" style="text-align:center;">
						<strong id="numeroDiagnostico"> # </strong>
					</div>
					<div id="fecha" class="col" style="text-align:center;">
						<strong id="fecha"> Fecha </strong>
					</div>
					<div id="hora" class="col" style="text-align:center;">
						<strong id="hora"> Hora </strong>
					</div>
					<div id="numConsulta" class="col" style="text-align:center;">
						<strong id="numConsulta"> Consulta </strong>
					</div>
					<div id="medico" class="col" style="text-align:center;">
						<strong id="medico"> Médico </strong>
					</div>
					<div id="detalles" class="col" style="text-align:center;">
						<strong id="detalles">Detalles</strong>
					</div>
					<div id="examenes" class="col" style="text-align:center;">
						<strong id="examenes">Resultados</strong>
					</div>
				</div>
				
				<hr style="height: 3px; background-color: blue; border: none;">
				
				<div id="consulta1" class="row" style=" margin-bottom: 1vh;">
					<div id="numeroDiagnostico" class="col" style="text-align:center;">
						<strong id="numeroDiagnostico"> 1 </strong>
					</div>
					<div id="fecha1" class="col" style="text-align:center;">
						<span id="fecha1"> 20-12-2024 </span>
					</div>
					<div id="hora1" class="col" style="text-align:center;">
						<span id="hora1"> 08:30 AM </span>
					</div>
					<div id="numConsulta1" class="col" style="text-align:center;">
						<span id="numConsulta1"> 1 </span>
					</div>
					<div id="medico1" class="col" style="text-align:center;">
						<span id="medico1"> Juan Carlos Medina </span>
					</div>
					<div id="detalles1" class="col" style="text-align:center;">
						<button class="boton" data-target="bloqueContenido1">Ver</button><br>
					</div>
					<div id="examenes1" class="col" style="text-align:center;">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="resultadosModal">Ver</button><br>
					</div>
				</div>
				<div class="bloque" id="bloqueContenido1" style="text-align:left; margin-bottom: 2vh; background-color: lightblue;">
					<p>El paciente resultó positivo a COVID-19 según los resultados de los exámenes de sangre. Se extendió una hoja de recetas con
					los medicamentos necesarios para su recuperación.</p>
				</div>
				
				<hr style="height: 3px; background-color: blue; border: none;">
						
				<div id="consulta2" class="row" style=" margin-bottom: 1vh;">
					<div id="numeroDiagnostico" class="col" style="text-align:center;">
						<strong id="numeroDiagnostico"> 2 </strong>
					</div>
					<div id="fecha2" class="col" style="text-align:center;">
						<span id="fecha1"> 20-12-2024 </span>
					</div>
					<div id="hora2" class="col" style="text-align:center;">
						<span id="hora2"> 04:30 PM </span>
					</div>
					<div id="numConsulta2" class="col" style="text-align:center;">
						<span id="numConsulta2"> 2 </span>
					</div>
					<div id="medico2" class="col" style="text-align:center;">
						<span id="medico2"> Juan Carlos Medina </span>
					</div>
					<div id="detalles" class="col" style="text-align:center;">
						<button class="boton" data-target="bloqueContenido2">Ver</button><br>
					</div>
					<div id="examenes2" class="col" style="text-align:center;">
						<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="resultadosModal">Ver</button><br>
					</div>
				</div>
				<div class="bloque" id="bloqueContenido2" style="text-align:left; margin-bottom: 2vh; background-color: lightblue;">
					<p>Nota del doctor.</p>
				</div>
				
				<hr style="height: 3px; background-color: blue; border: none;">
				
				<div id="consulta3" class="row" style=" margin-bottom: 1vh;">
					<div id="numeroDiagnostico" class="col" style="text-align:center;">
						<strong id="numeroDiagnostico"> 3 </strong>
					</div>
					<div id="fecha3" class="col" style="text-align:center;">
						<span id="fecha3"> 20-12-2024 </span>
					</div>
					<div id="hora3" class="col" style="text-align:center;">
						<span id="hora3"> 10:30 AM </span>
					</div>
					<div id="numConsulta3" class="col" style="text-align:center;">
						<span id="numConsulta3"> 3 </span>
					</div>
					<div id="medico3" class="col" style="text-align:center;">
						<span id="medico3"> Juan Carlos Medina </span>
					</div>
					<div id="detalles" class="col" style="text-align:center;">
						<button class="boton"  data-target="bloqueContenido3">Ver</button><br>
					</div>
					<div id="examenes3" class="col" style="text-align:center;">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="resultadosModal">Ver</button><br>
					</div>
				</div>
				<div class="bloque" id="bloqueContenido3" style="text-align:left; margin-bottom: 2vh; background-color: lightblue;">
					<p>Nota del doctor.</p>
				</div>
				<hr style="height: 3px; background-color: blue; border: none;">
			</div>
		</div> 

		                                  <!-- Modal RESULTADOS -->
		<div class="modal fade" id="resultadosModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Resultados de los exámenes</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		

		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../js/administrador.js"></script> 
		<script src="../js/expediente.js"></script>
		<script src="../js/medicos.js"></script>

	</body>
</html>