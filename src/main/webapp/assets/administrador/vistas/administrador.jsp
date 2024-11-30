<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Administrador</title>
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
		<div class="container-fluid" style="margin-left: 20vw; margin-top: 30vh; width:85vw;">
		    <h1 style="text-align: center;">Bienvenido, administrador</h1>
		    <p style="text-align: center;">Visite nuestro menú para ver más opciones </p>
		</div>

		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../js/administrador.js"></script>
	</body>
</html>