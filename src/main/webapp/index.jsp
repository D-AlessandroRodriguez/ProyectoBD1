<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hospital San Jesús</title>
		<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/login/css/loggin-style.css">
	</head>
	<body>
		<div id="loginBox" class="shadow-lg">
			<br>
			<img src="assets/img/logo-hospital.png" hspace="20px" height="70px" alt="La imagen no se cargó correctamente" style="position:absolute">
			<h3 id="title1" style="color: rgba(34, 25, 115, 1); text-align: center">Hospital San Jesús</h3>
			<h4 class="txt text-center">Inicio de sesión</h4>
			<br>
			<form id="form" class="d-grid mx-auto col-9 mt-3">
				<input type="email" id="emailInput" class="shadow custom-input form-control rounded-5" id="exampleFormControlInput1" placeholder="Correo electrónico">
				<input type="password" id="passwordInput" class="shadow custom-input form-control rounded-5 mt-4" id="exampleFormControlInput2" placeholder="Contraseña">
			</form>
			<div class="d-grid col-3 mx-auto mt-5">
			  <button type="submit" class="btn btn-primary shadow rounded-5" type="button">Ingresar</button>
			</div>
	        <p class="author text-center mt-4" style="font-size: 12px;">© Todos los derechos reservados - BasesDeDatos1</p>
		</div>
		<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>