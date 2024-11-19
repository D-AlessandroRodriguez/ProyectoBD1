<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Administrador</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		
		<style>
			
			#menuLateral {
		      position: fixed;
		      top: 10.5vh;
		      left: -260px; /* Menu oculto por defecto */
		      width: 20vw;
		      height: 100%;
		      background-color: #343a40;
		      color: white;
		      transition: all 0.3s ease;
		    }
		    
		    #menuLateral a { /* Seleccionamos todos los elementos de tipo a dentro de #menuLateral */
		      color: white; /* Color de la fuente */
		      text-decoration: none; /* Ocultar underline de hipervínculo */
		      padding: 10px 25px; /* Margen del bloque */
		      display: block; /* Mostrar como un bloque */
		    }
		    
		    #menuLateral.active {
		      left: 0; /* Despliega el menu */
		    }
		    
		    #menuLateral a:hover { /* :hover es una pseudo-clase que aplica estilos cuando el usuario coloca el cursor sobre un elemento */
		      background-color: #575757; /* Cambia el fondo a gris */
		    }
			
		</style>
		
	</head>	
	<body>
	<!-- Encabezado de la página -->
		<nav class="navbar fixed-top bg-primary" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">
					<img src="assets/img/logo-hospital.png" alt="Logo" width="35" height="30" class="d-inline-block align-text-top">
					Hospital San Jesús
					<!-- Botón para activar el sidebar -->
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
		    <a href="#">Usuarios</a>
		    <a href="#">Pacientes</a>
		    <a href="#">Consultas</a>
		    <a href="#">Expedientes</a>
		    <a href="#">Pagos</a>
		    <a href="#">Farmacia</a>
		    <a href="#">Laboratorio</a>
		    <a href="#">Configuración</a>
		    <a href="#">Cerrar sesión</a>
		</div>
		
		<!-- Página principal -->
		<div class="container-fluid" style="margin-left: 20vw; margin-top: 30vh; width:80vw;">
		    <h1 style="text-align: center;">Bienvenido, administrador</h1>
		    <p style="text-align: center;">Visite nuestro menú para ver más opciones </p>
		</div>

		<script src="assets/js/bootstrap.bundle.min.js"></script>
		<script src="assets/js/administrador.js"></script>
	</body>
</html>