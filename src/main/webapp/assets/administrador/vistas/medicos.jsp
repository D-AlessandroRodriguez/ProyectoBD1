<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Usuarios</title>
		<link rel="stylesheet" href="../../css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/administrador.css">		
		<link rel="stylesheet" href="../css/medicos.css">		
	</head>
	<body>
		<!-- Encabezado de la página -->
		<nav class="navbar fixed-top bg-primary" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">
					<img src="../../img/logo-hospital.png" alt="Logo" width="35" height="30" class="d-inline-block align-text-top">
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
				    <li><a class="dropdown-item" href="#">Médicos</a></li>
				    <li><a class="dropdown-item" href="#">Otros</a></li>
	  			</ul>
  			</div>
  			
		    <a href="#">Pacientes</a>
		    
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
		
		<div class="container text-center" style="margin-left: 16vw; margin-top: 15vh; width:80vw;">
			<div class="row align-items-start">
				<div class="col">
					<h3 class="pt-3">Médicos </h3>
				</div>
				<div class="col"></div>
				<div class="col" style="margin-top: 2.5vh;">
					<button id="registrarEmpleadoBoton" type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#registrarEmpleadoModal" data-bs-whatever="registrarEmpleado"> Registrar </button>
				</div>
			</div>
		</div>
		
		<!-- Modal para registrar medico -->
		<div id="registrarEmpleadoModal" class="modal fade" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Registrar empleado</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label for="primerNombre" class="form-label">Ingrese el primer nombre</label>
							<input type="text" class="form-control" id="primerNombre" name="primerNombre" placeholder="Primer nombre">
						</div>
						<div class="mb-3">
							<label for="segundoNombre" class="form-label">Ingrese el segundo nombre</label>
							<input type="text" class="form-control" id="segundoNombre" name="segundoNombre" placeholder="Segundo nombre">
						</div>
						<div class="mb-3">
							<label for="primerApellido" class="form-label">Ingrese el primer apellido</label>
							<input type="text" class="form-control" id="primerApellido" name="primerApellido" placeholder="Primer apellido">
						</div>
						<div class="mb-3">
							<label for="segundoApellido" class="form-label">Ingrese el segundo apellido</label>
							<input type="text" class="form-control" id="segundoApellido" name="segundoApellido" placeholder="Segundo apellido">
						</div>
						
						<div class="mb-3">
							<label for="correo" class="form-label">Fecha de nacimiento</label>
							<input type="date" class="form-control" id="fecha" name="fecha">
						</div>
						<div class="mb-3">
							<label for="correo" class="form-label">Ingrese el correo electrónico</label>
							<input type="email" class="form-control" id="correo" name="correo" placeholder="ejemplo@gmail.com">
						</div>
						<div class="mb-3">
							<label for="telefono" class="form-label">Teléfono</label>
							<input type="text" class="form-control" id="telefono" name="telefono" placeholder="9999-9999">
						</div>
						
						<div class="mb-3">
							<label for="sexo" class="form-label" style="margin-right: 3vw;">Sexo</label>
							<select id="sexo" class="btn btn-primary">
							    <option value="">Seleccione</option>
							    <option value="femenino">Femenino</option>
							    <option value="masculino">Masculino</option>
						  </select>
						</div>
						
						<div class="mb-3">
							<!-- Selector Principal -->
						  <label for="pais" style="margin-right: 1vw;">País</label>
						  <select id="selectPais" class="btn btn-primary" class="form-select" disabled>
						    <option value="" disabled selected>Seleccione</option>
						  </select>
						  
						  <!-- Selector Principal -->
						  <label for="selectDeptos" style="margin-right: 1vw; margin-left: 2vw;">Departamento</label>
						  <select id="selectDeptos" class="btn btn-primary" class="form-select" disabled>
						    <option value="" disabled selected>Seleccione</option>
						  </select>
							
						</div>
						
						<div class="mb-3">
							<!-- Selector Principal -->
						  <label for="depto" style="margin-right: 1vw;">Ciudad</label>
						  <select id="depto" class="btn btn-primary" class="form-select" disabled>
						    <option value=""disabled selected>Seleccione</option>
						  </select>

						  <label for="depto" style="margin-right: 1vw; margin-left: 2vw;">Colonia</label>
						  <select id="depto" class="btn btn-primary" class="form-select" disabled>
						    <option value=""disabled selected>Seleccione</option>
						  </select>
							
						</div>
						
						<div class="mb-3">
						  <label for="referencia" class="form-label">Referencia</label>
						  <textarea class="form-control" id="referencia" name="referencia" rows="2"></textarea>
							
						</div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
						<button type="button" class="btn btn-primary">Guardar</button>
					</div>
				</div>
			</div>
		</div>
	
			
			
		<script src="../../js/bootstrap.bundle.min.js"></script>
		<script src="../js/administrador.js"></script>
		<script src="../js/medicos.js"></script>
	</body>
</html>