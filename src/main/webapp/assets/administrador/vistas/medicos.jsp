<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Médicos</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/administrador.css">		
		<link rel="stylesheet" href="../css/medicos.css">		
		<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.min.css">
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
			
			<!--
			<div class="btn-group dropend btn-dark">
			    <a class="btn btn-light-bg-subtle dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    Usuarios
			    </a>
			    <ul class="dropdown-menu dropdown-menu-dark">
				    <li><a class="dropdown-item" href="medicos.jsp">Médicos</a></li>
				    <li><a class="dropdown-item" href="#">Otros</a></li>
	  			</ul>
  			</div> -->
			
		    <a href="pacientes.jsp">Pacientes</a>
		    
		    <!-- 
		    <div class="btn-group dropend btn-dark">
			    <a class="btn btn-light-bg-subtle dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			    Consultas
			    </a>
			    <ul class="dropdown-menu dropdown-menu-dark">
				    <li><a class="dropdown-item" href="#">Ver todo</a></li>
				    <li><a class="dropdown-item" href="crearNuevo.jsp">Crear nuevo</a></li>
	  			</ul>
  			</div> -->
  			
		    <a href="medicos.jsp">Empleados</a>
		    <a href="consultas.jsp">Consultas</a>
		    <a href="#">Pagos</a>
		    <a href="#">Farmacia</a>
		    <a href="#">Laboratorio</a>
		    <a href="#">Configuración</a>
		    <a href="#">Cerrar sesión</a>
		</div>
		
		<div class="container text-center" style="margin-left: 16vw; margin-top: 15vh; width:80vw;">
			<div class="row align-items-start">
				<div class="col">
					<h3 class="pt-3">Empleados </h3>
				</div>
				<div class="col"></div>
				<div class="col" style="margin-top: 2.5vh;">
					<button id="registrarEmpleadoBoton" type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#registrarEmpleadoModal" data-bs-whatever="registrarEmpleado"> Registrar empleado</button>
				</div>
			</div>
		</div>
		
		
		
		                                <!-- MODAL PARA REGISTRAR EMPLEADO -->
		                                
		                                
		<div id="registrarEmpleadoModal" class="modal fade modal-lg" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">Registrar nuevo empleado</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<h4 style="margin-bottom: 1vw;">Datos generales</h4>
						<div class="mb-3">
							<div class="row align-items-start">
								<div class="col">
									<label for="primerNombre" class="form-label">Ingrese el primer nombre</label>
									<input type="text" class="form-control" id="primerNombre" name="primerNombre" placeholder="Primer nombre" required>
								</div>
								<div class="col">
									<label for="segundoNombre" class="form-label">Ingrese el segundo nombre</label>
									<input type="text" class="form-control" id="segundoNombre" name="segundoNombre" placeholder="Segundo nombre">
								</div>
							</div>
						</div>
						<div class="mb-3">
							<div class="row align-items-start">
								<div class="col">
									<label for="primerApellido" class="form-label">Ingrese el primer apellido</label>
									<input type="text" class="form-control" id="primerApellido" name="primerApellido" placeholder="Primer apellido" required>
								</div>
								<div class="col">
									<label for="segundoApellido" class="form-label">Ingrese el segundo apellido</label>
									<input type="text" class="form-control" id="segundoApellido" name="segundoApellido" placeholder="Segundo apellido">
								</div>	
							</div>
						</div>
						
						<div class="mb-3">
							<div class="row align-items-start">
								<div class="col">
									<label for="correo" class="form-label">Fecha de nacimiento</label>
									<input type="date" class="form-control" id="fecha" name="fecha" required>
								</div>
								<div class="col">
									<label for="DNI" class="form-label">DNI</label>
									<input type="text" class="form-control" id="DNI" name="DNI" placeholder="XXXX-XXXX-XXXX" required>
								</div>
							</div>
						</div>
						
						<div class="mb-3">
							<div class="row align-items-start">
								
								<div class="col">
									<label for="correo" class="form-label">Ingrese el correo electrónico</label>
									<input type="email" class="form-control" id="correo" name="correo" placeholder="ejemplo@gmail.com" required>
								</div>
							</div>
						</div>
						
						<div class="mb-3">
							<div class="row align-items-start">
								<div class="col">
									<label for="telefono" class="form-label">Teléfono</label>
									<input type="text" class="form-control" id="telefono" name="telefono" placeholder="9999-9999" required>
								</div>
								<div class="col">	
									<br><label for="sexo" class="form-label" style="margin-left: 3vw; margin-right: 1vw;">Sexo</label>
									<select id="sexo" class="btn btn-primary" class="form-select">
									    <option value="" disabled selected>Seleccione</option>
									    <option value="F">Femenino</option>
									    <option value="M">Masculino</option>
								    </select>
								</div>
							</div>
						</div>
						
						<div class="mb-3">
							<!-- Selector Principal -->
						  <label for="pais" class="form-label" style="margin-right: 1vw; margin-left: 2vw;">País</label>
						  <select id="pais" class="btn btn-primary" class="form-select">
						    <option value="" disabled selected>Seleccione</option>
							<option value="1">Honduras</option>
							<option value="2">El Salvador</option>
							<option value="3">Guatemala</option>
							<option value="4">Panamá</option>
						  </select>
						  
						  <!-- Selector Principal -->
						  <label for="depto" class="form-label" style="margin-right: 1vw; margin-left: 2vw;">Departamento</label>
						  <select id="depto" class="btn btn-primary" class="form-select">
						    <option selected>Seleccione</option>
						  </select>
						  
						  <!-- Selector Principal -->
						  <label for="ciudad" class="form-label" style="margin-right: 1vw; margin-left: 2vw;">Ciudad</label>
						  <select id="ciudad" class="btn btn-primary" class="form-select" disabled>
						    <option selected>Seleccione</option>
						  </select>
							
						</div>
						
						<div class="mb-3">
							<!-- Selector Principal -->
						  <label for="colonia" style="margin-right: 1vw; margin-left: 2vw;">Colonia</label>
						  <select id="colonia" class="btn btn-primary" class="form-select" disabled>
						    <option selected>Seleccione</option>
						  </select>
							
						</div>
						
						<div class="mb-3">
						  <label for="referencia" class="form-label">Referencia</label>
						  <textarea class="form-control" id="referencia" name="referencia" rows="2"></textarea>
						</div>
						
						<hr style="margin-bottom: 8vh; margin-top:12vh; border-top: 3px solid blue;">
						<h4 style="margin-bottom: 4vh;">Datos de usuario</h4>
						<div class="mb-3">
							<!-- Selector Principal -->
						  <label for="deptoHospital" class="form-label" style="margin-right: 1vw; margin-left: 2vw;">Departamento</label>
						  <select id="deptoHospital" class="btn btn-primary" class="form-select">
							<option value="" disabled selected>Seleccione</option>
						    <option value="1">Salud</option>
							<option value="2">Recursos humanos</option>
							<option value="3">Contabilidad</option>
							<option value="4">Operaciones</option>
						  </select>
						  
							<!-- Selector Principal -->
						  <label for="cargo" class="form-label" style="margin-right: 1vw; margin-left: 2vw;">Cargo</label>
						  <select id="cargo" class="btn btn-primary" class="form-select">
						    <option value="" disabled selected>Seleccione</option>
							<option value="1">Médico</option>
							<option value="2">Enfermero</option>
							<option value="3">Administrador</option>
							<option value="4">Cajero</option>
							<option value="5">Recepcionista</option>
							<option value="6">Atención al cliente</option>
						  </select>
					
						</div>
						
						<div class="mb-3">
						  <!-- Selector Principal -->
						  <label for="especialidad" class="form-label" style="margin-right: 1vw; margin-left: 2vw;">Especialidad</label>
						  <select id="especialidad" class="btn btn-primary" class="form-select">
						    <option value=""disabled selected>Seleccione</option>
							<option value="1">Medicina general</option>
							<option value="2">Neurología</option>
							<option value="3">Cardiología</option>
							<option value="4">Ginecología</option>
							<option value="5">Pediatría</option>
							<option value="6">Ninguna</option>
						  </select>
						</div>
						
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
						<button id="saveButton" type="button" class="btn btn-primary" data-bs-target="#crearUsuario" data-bs-toggle="modal">Guardar</button>
					</div>
				</div>
			</div>
		</div>
		
		
		                                <!-- MODAL PARA REGISTRAR USUARIO -->
		                                
		 
		<div id="crearUsuario" class="modal fade" aria-hidden="true" aria-labelledby="crearUsuarioTitle" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="crearUsuarioTitle">Crear un nuevo usuario</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
				        	<label for="correoIngresado"style="margin-right: 2vw;">Usuario: </label>
							<input type="text" id="correoIngresado" disabled />
						</div>
						
						<div class="mb-3">
							<label for="pwd" class="form-label" style="margin-top: 2vh;">Contraseña: </label>
							<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Incluya mayúsculas y caracteres especiales" maxlength="20" pattern="(?=.*\d)(?=.*[a-zA-Z]).{8,}" required>
				        </div>
			        	
			        	<div class="mb-3">
				        	<!-- Selector Principal -->
							<label for="rol" class="form-label" style="margin-right: 1vw;">Rol</label>
							<select id="rol" class="btn btn-primary" class="form-select">
							    <option value=""disabled selected>Seleccione</option>
								<option value="1">Administrador</option>
								<option value="2">Editor</option>
								<option value="3">Usuario estándar</option>
								<option value="4">Invitado</option>
							</select>
						</div>
						
			        </div>	
					<div class="modal-footer">	
						<button id="secondSaveButton" class="btn btn-primary" data-bs-toggle="modal">Guardar</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Página principal -->
		<div id="contenedorPrincipal" class="container" style="margin-left: 16vw; width:80vw;">
			<div id="tituloRowContainer" class="row">
			</div>
			<div id="tablaRowContainer" class="row overflow-auto">
				<div class="col px-5 mt-1 mb-2">
					<table id="employeesTable" class="table table-hover text-center">
						<thead id="encabezadosDeTabla">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nombre</th>
								<th scope="col">Apellido</th>
								<th scope="col">Departamento</th>
								<th scope="col">Cargo</th>
								<th scope="col">Usuario</th>
								<th scope="col">Perfil</th>
							</tr>
						</thead>
						<tbody>	
<%
							StringBuilder result = new StringBuilder();
							for (int i = 1; i <= 15; i++) {
								result.append("<tr>");
								result.append("<th scope=\"row\">");
								result.append(String.format("<span id=\"numeroMedico%sSpan\">%s</span>",i,i));
								result.append("</th>");
								result.append("<td>");
								result.append(String.format("<span id=\"primerNombreMedico%sSpan\">Jesús</span> <span id=\"primerApellidoMedico%sSpan\">Zepeda</span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"especialidad%sSpan\">Especialidad</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"usuario%sSpan\">ejemplo@gmail.com</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<a class=\"link-opacity-50-hover\" href=\"perfilMedico.jsp?perfil=%s\">Ver</a>",i));
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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.min.js"></script>
		<script src="../js/administrador.js"></script> 
		<script src="../js/medicos.js"></script>
		<script src="../js/dataTables.js"></script>
	</body>
</html>