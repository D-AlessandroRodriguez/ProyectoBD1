<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Generar Recetas: Receta</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/viewInteractionMedico-style.css">
	</head>
	<body>
		<!-- Menú de navegación -->
		<nav class="navbar sticky-top bg-primary navbar-expand-lg"
			style="height: 10vh;" data-bs-theme="dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="viewMedico.jsp"> <img
					src="../img/logo-hospital.png" alt="Logo" width="35px" height="30px"
					class="d-inline-block align-text-top"> Hospital San Jesús
				</a>
				<!--hr vertical de boostrap-->
				<div class="vr mx-1" style="color: white; width: 3px;"></div>
				<!--  no se para que-->
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
					aria-controls="navbarNavDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">botones</span>
				</button>
				<!-- nav para tener dentro los botones para interactuar -->
				<div class="collapse navbar-collapse mx-2" id="navbarNavDropdown">
					<ul class="navbar-nav d-flex gap-2">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle link-light" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Generar </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" id="verOrdenesRecetasMenu"
									href="generatorReceta.jsp">Receta</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle link-light" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Nuevo </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" id="crearCosulta"
									href="crearConsulta.jsp">Crear consulta</a></li>
								<li><a class="dropdown-item" id="crearDiagnostico"
									href="crearDiagnosticos.jsp">Crear diagnostico</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle link-light" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Existente </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" id="verConsultas"
									href="verConsultasMedico.jsp">Ver Consultas del medico</a></li>
							</ul></li>
					</ul>
				</div>
				<ol class="breadcrumb mb-0">
					<li class="breadcrumb-item"><a class="link-light"
						href="viewMedico.jsp">Medico</a></li>
					<li class="breadcrumb-item active" aria-current="page">Generar
						receta</li>
				</ol>
			</div>
		</nav>
	
		<div id="contenedorPrincipal" class="container">
	
			<div class="container flex border  rounded shadow"
				style="position: absolute; top: 12vh; height: 76vh; left: 20vw; width: 60vw;">
				<div class="d-flex flex-row p-3">
	
					<div class="col-md-3 p-4">
						<div class="row d-flex justify-content-start fw-bold"><span style="font-size:20px">Receta</span></div>
							<img hspace="13px" src="../img/logo-hospital.png" alt="Logo" width="35px"
								height="30px" class="d-inline-block align-text-top"	>
						</div>	
	
					<div class="col-sm-6 justify-content-center p-4 fw-bold">
						<label class="row justify-content-center text-center">Hospital
							San Jesus</label> <label class="row justify-content-center text-center">Consulta
							General</label> <label class="row justify-content-center text-center">Dr.
							Sorto</label>
					</div>
				</div>
	
	
				<div class="row p-2 ">
					<hr class="border-top  border-black border-2 opacity-75">
	
					<div class="col-md-6 fw-bold">
						<label class="row justify-content-start">Paciente: Cesar</label>
					</div>
					<div class="col-md-6 px-2 fw-bold">
						<div class="d-flex flex-row-reverse">
							<label class="px-2">Fecha: 10/11/2024</label> <label class="px-2">Edad:
								50</label>
						</div>
					</div>
					<hr class="border-bottom  border-black border-2 opacity-75">
				</div>
	
	
				<div class="row p-2">
					<div class="col-md-3 ">
						<label for="ciudadDireccion" class="form-label fw-bold w-100">
							Tipo producto </label> <select class="form-select"
							aria-label="Default select example" required>
							<option selected>Seleccionar</option>
							<option value="1">Analgesico</option>
							<option value="2">Antidolor</option>
	
						</select>
	
					</div>
					<div class="col-md-3 ">
						<label for="ciudadDireccion" class="form-label fw-bold w-100">Marca
						</label> <select class="form-select" aria-label="Default select example"
							required>
							<option selected>Seleccionar</option>
							<option value="1">1</option>
							<option value="2">2</option>
	
						</select>
	
					</div>
					<div class="col-md-3 ">
						<label for="ciudadDireccion" class="form-label fw-bold w-100">
							Nombre producto </label> <select class="form-select"
							aria-label="Default select example" required>
							<option selected>Seleccionar</option>
							<option value="1">Panadol</option>
							<option value="2">Milagrosa</option>
	
						</select>
	
					</div>
					<div class="col-md-3 ">
						<label for="ciudadDireccion" class="form-label fw-bold w-100">
							Cantidad producto </label> <select class="form-select"
							aria-label="Default select example" required>
							<option selected>Seleccionar</option>
							<option value="1">10 tabletas</option>
							<option value="2">1 jarabe</option>
	
						</select>
	
					</div>
					<div class="col-md-3 ">
						<label for="ciudadDireccion" class="form-label fw-bold w-100">
							Unidad medida </label> <select class="form-select"
							aria-label="Default select example" required>
							<option selected>Seleccionar</option>
							<option value="1">10 miligramos</option>
							<option value="2">50 miligramos</option>
	
						</select>
	
					</div>
				</div>
	
	
				<div class="row p-2">
					<hr class="border-bottom  border-black border-2 opacity-75">
					<div class="col-md-4 px-2 pt-1 fw-bold">
						<div class="row justify-content-start">
							<label class="col-auto">www.hospitalSanJesus.com</label>
						</div>
						<div class="row justify-content-start">
							<label class="col-auto">2235-4523</label> <label class="col-auto">
								2235-9876</label>
						</div>
					</div>
	
	
					<div class="col-md-8 pt-1 px-2 fw-bold">
						<label class="row justify-content-end">Tegucigalpa, M.D.C.
							Blvd. Suyapa</label> <label class="row justify-content-end">Contiguo
							a la UNAH</label>
					</div>
				</div>
			</div>
		</div>

		<div class="p-3 border-top text-center" id="botonContainer"
			style="position: sticky; bottom: 0;">
			<button type="submit" class="btn btn-primary w-50 fw-bold">Guardar
				receta</button>
		</div>
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>