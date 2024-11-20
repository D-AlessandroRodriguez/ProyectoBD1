<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hospital San Jesús</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/loggin-style.css">
		<link rel="stylesheet" href="assets/css/toastError-style.css">
	</head>
	<body>
		<div id="loginBox" class="shadow-lg">
			<br>
			<img src="assets/img/logo-hospital.png" hspace="20px" height="70px" alt="La imagen no se cargó correctamente" style="position:absolute">
			<h3 id="title1" style="color: rgba(34, 25, 115, 1); text-align: center">Hospital San Jesús</h3>
			<h4 class="txt text-center">Inicio de sesión</h4>
			<br>
			<form id="form" class="d-grid mx-auto col-9 mt-3">
			<input type="email" id="emailInput" class="shadow custom-input form-control rounded-5" id="exampleFormControlInput1" placeholder="Correo electrónico" required>
				<input type="password" id="passwordInput" class="shadow custom-input form-control rounded-5 mt-4" id="exampleFormControlInput2" placeholder="Contraseña">
			</form>
			<div class="d-grid col-3 mx-auto mt-5">
			  <button type="submit" id="buttonSend" class="btn btn-primary shadow rounded-5" >Ingresar</button>
			</div>
	        <p class="author text-center mt-4" style="font-size: 12px;">© Todos los derechos reservados - BasesDeDatos1</p>
	       
		</div>
		
		
     <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" id="modalError" >
      <div class="toast-header">
        <img src="..." class="rounded me-2" alt="...">
        <strong class="me-auto">Error</strong>
        <small class="text-body-secondary">just now</small>
        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
      <div class="toast-body">
        <h5 id="textError"></h5>
      </div>
    </div>
    
		<script src="assets/js/bootstrap.bundle.min.js"></script>
		
		<script src="assets/js/Validator.js"></script>
		<script src="assets/js/ErrorModal.js"></script>
		<script src="assets/js/bootstrap.bundle.min.js"></script>
		
		<script src="assets/js/ActionLogin.js"></script>
		<script src="assets/js/ProcessData.js"></script>
		<script src="assets/js/mainLogin.js"></script>
	</body>
</html>