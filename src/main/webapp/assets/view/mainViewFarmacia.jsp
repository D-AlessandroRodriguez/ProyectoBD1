<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Página principal: Farmacia</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css">
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
			          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Ver
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="#">Órdenes de recetas</a></li>
			            <li><a class="dropdown-item" href="#">Productos</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Registrar
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="#">Productos</a></li>
			            <li><a class="dropdown-item" href="#">Lotes de Productos</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    <div class="text-white">Farmacia</div>
			</div>
		</nav>
		<!-- Página principal -->
		<div class="container" style="height: 90vh;">
			<div class="row h-100 align-items-center">
				<div class="col text-center">
					<h1>Bienvenido, <span id="employeeNameSpan">Jesús Zepeda</span>!</h1>
		    		<p>Visite nuestro menú para ver más opciones.</p>
				</div>
			</div>
		</div>
		<script src="../js/bootstrap.bundle.min.js"></script>
	</body>
</html>