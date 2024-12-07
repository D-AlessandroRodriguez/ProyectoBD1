<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Perfil</title>
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
		    <a href="#">Inicio</a>
			
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
		
		<!-- DATOS GENERALES -->
		<div class="container" style="margin-left: 16vw; margin-top: 15vh; width:80vw;">
			<div class="row align-items-start">
				<div class="col">
					<h3 class="pt-3">Datos generales </h3>
				</div>
				<div class="col" style="text-align: right; margin-top: 2.5vh;">
					<a href="medicos.jsp" class="btn btn-danger"> Cerrar ventana </a>
				</div>
			</div>
			
			<div id="datosGenerales" class="container" style=" margin-top: 2vh; border-radius: 10px; background-color: lightblue;">
				<div class="row align-items-start">
					<div class="col" style="text-align: center">
						<img src="../img/icon.png" alt="Logo" width="180" height="180" class="d-inline-block align-text-top">
						<br>
						<button id="editarFotoMedico" class="btn btn-primary">Editar foto</button>
						<button id="editarFotoMedico" class="btn btn-danger">Borrar foto</button> 
						<br><br> 
						<span> <strong> Especialidad(es): </strong> </span> <br>
						<span> Pediatría </span> <br> 
						<span> Ginecología </span> <br><br>
					</div>
					<div class="col" style="margin-top:3.5vh;">
						<span> <strong> Nombre(s): </strong> </span> <br>
						<span> María José </span> <br> <br>
						<span> <strong> Apellido(s): </strong> </span> <br>
						<span> López Guerra </span> <br> <br>
						<span> <strong> Fecha de nacimiento: </strong> </span> <br>
						<span> 1980-03-03 </span> <br> <br>
						<span> <strong> Dirección: </strong> </span> <br>
						<span> Tegucigalpa, La Kennedy, quinta entrada </span> <br> <br>
						
					</div>
					<div class="col" style="margin-top:3.5vh;">
						<strong> DNI: </strong> <br>
						<span> 0801-1980-17210 </span> <br><br>
						<strong> Número de empleado: </strong> <br>
						<span> 20203628 </span> <br><br>
						<span> <strong> Teléfono(s): </strong> </span> <br>
						<span> 9999-9999 / 8888-8888 </span> <br> <br>
						<span> <strong> Correo(s) electrónico(s): </strong> </span> <br>
						<span> correo1@gmail.com / correo2@gmail.com </span> <br> <br>
						
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- DATOS DEL USUARIO -->
		<div class="container" style="margin-left: 16vw; margin-top: 5vh; width:80vw;">
			<div class="row align-items-start">
				<div class="col">
					<h3 class="pt-3">Datos del usuario </h3>
				</div>
				<div class="col"></div>
			</div>
			
			<div id="datosUsuario" class="container" style=" margin-top: 2vh; border-radius: 10px; background-color: lightblue;">
				<div class="row align-items-start">
					<div class="col" style="margin-left: 3vw; margin-top:3.5vh; margin-bottom:3.5vh;">
						<span> <strong> Usuario: </strong> </span>
						<span> correo1@gmail.com</span> <br>
						<span> <strong> Rol(es): </strong> </span>
						<span> Médico </span> <br>
						<span> <strong> Permiso(s): </strong> </span>
						<span> Actualizar/Ver </span> <br>
					</div>
					<div class="col"  style="margin-top:6vh; margin-bottom:3.5vh;">
						<button id="editarUsuarioMedico" class="btn btn-danger">Editar usuario</button>
						<button id="editarRolMedico" class="btn btn-danger">Editar rol</button>
						<button id="editarPermisosMedico" class="btn btn-danger">Editar permisos</button>
					</div>
				</div>
			</div>
		</div>
		
		<br><br><br>
		
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../js/administrador.js"></script>				
	</body>
</html>