<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hospital San Jesus</title>
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<style>
			body{
				background-image: url("assets/img/font-login.png"); 
			}
			
			#form{
				
			}
			
			#cuerpo{
				position: absolute;
				background-color: rgba(217, 217, 217, 1);
				border: rgba(217, 217, 217, 1) black 3px;
				border-radius: 25px;
				width: 40%;
				height: 60vh;
				top: 20vh;
				left: 30vw;
			}
			
			.custom-input {
			 	position: relative;
			 	left: 6vw;
			 	width: 400px;
			 	border-radius: 40px;
			 }
			 
		</style>
	</head>
	<body>
				<div id="cuerpo">
					<br>
					<img src="assets/img/logo-hospital.png" hspace="20px" height="70px" alt="La imagen no se cargo correctamente" style="position:absolute"></img>
					<h3 id="title1" style="color: rgba(34, 25, 115, 1); text-align: center">Hospita San Jesus</h3>
					<h4 class="txt" style="text-align: center">Inicio de sesión</h4>
					<br>
					<form class="row g-3"> 
					  <div class="mb-3">
					    <input type="email" class="custom-input form-control" id="exampleFormControlInput1" placeholder="Correo">
					  </div>
					  <div class="mb-3">
					    <input type="password" class="custom-input form-control" id="exampleFormControlInput2" placeholder="Contra">
					  </div>
					</form>

					 <button type="submit" class="btn btn-primary mb-3" style="margin-bottom: 20px; width: 140px; position: relative; left: 15vw;border-radius: 40px">Ingresar</button>
                	<br><br><br>
                	<p class="author" style="text-align: center; font-size: 12px">&nbsp;
                    	© Todos los derechos reservados - BasesDeDatos1 <br></p>
				</div>
		<script src="assets/js/bootstrap.bundle.min.js"></script>
	</body>
</html>