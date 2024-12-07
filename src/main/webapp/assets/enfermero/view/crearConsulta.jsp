<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nueva: Consulta</title>
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/viewInteractionMedico-style.css">
<link rel="stylesheet" href="../css/createConsulta-style.css">
</head>
<body>
	<!-- Menú de navegación -->
	<nav class="navbar sticky-top bg-primary navbar-expand-lg"
		style="height: 10vh;" data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="viewEnfermero.jsp"> <img
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
						data-bs-toggle="dropdown" aria-expanded="false">Crear </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" id="verOrdenesRecetasMenu"
								href="crearExpediente.jsp">Expediente</a></li>
							<li><a class="dropdown-item" id="verOrdenesRecetasMenu"
								href="crearConsulta.jsp">Consulta</a></li>
						</ul></li>


				</ul>
			</div>
			
		</div>
	</nav>
	<!-- Página principal -->
	<div id="contenedorPrincipal" class="container">
		<div id="tituloRowContainer" class="row"></div>
		<div class="container border rounded  shadow" id="formConsulta "
			style="position: absolute; top: 15vh; left: 25vw; width: 50vw; height: 70vh; display: flex; flex-direction: column;">
			<div class="form-container text-center p-3 border-bottom ">
				<h2 class="fw-bold">Nueva consulta</h2>
			</div>

			<div class="p-4" id="camposContainer"
				style="flex: 1; overflow-y: auto;">
				<form>

					

					<div class="row mb-3">
						<div class="col-mb-3 col-md-6">
							<label for="paciente" class="form-label fw-bold  ">Paciente</label>
							<input type="text" class="form-control" id="paciente"
								name="paciente" required>
						</div>
						<div class="col-mb-3 col-md-6">
							<label for="pacienteDNI" class="form-label fw-bold  col-md-6">DNI</label>
							<input type="text" class="form-control" id="pacienteDNI"
								name="pacienteDNI" required>
						</div>
					</div>
						<div class="row mb-3">
						<div class="col-mb-3 col-md-6">
							<label for="paciente" class="form-label fw-bold  ">Departamento</label>
								<select
								class="form-select" aria-label="Default select example" required>
								<option selected>Seleccionar</option>
								<option value="1">Nerologia</option>
								<option value="2">Cardiologia</option>

							</select>
						</div>
						<div class="col-mb-3 col-md-6">
							<label for="paciente" class="form-label fw-bold  col-md-6">Doctor</label>
							<select
								class="form-select" aria-label="Default select example" required>
								<option selected>Seleccionar</option>
								<option value="1">Dr. Zepeda</option>
								<option value="2">Dr. Blandin</option>

							</select>
						</div>
					</div>
					<div class=" row mb-3 ">
						<div class="col-md-6">
							<label for="fechaConsulta" class="form-label fw-bold">Fecha</label>
							<input type="date" class="form-control" id="fechaConsulta"
								name="fecha" required>
						</div>
						<div class="col-md-6">
							<label for="horaConsulta" class="form-label fw-bold">Hora</label>
							<input type="time" class="form-control" id="horaConsulta"
								name="hora" required>
						</div>
					</div>

					<div class="col-md-6 mb-3">
						<label for="costoConsulta" class="form-label fw-bold">Costo</label>
						<input type="text" class="form-control" id="costoConsulta"
							name="costo" required>
					</div>
				</form>
			</div>

			<div class="p-3 border-top text-center" id="botonContainer"
				style="position: sticky; bottom: 0;">
				<button type="submit" class="btn btn-primary w-100 fw-bold">Registrar
					Consulta</button>
			</div>
		</div>




		<div id="tablaRowContainer" class="row overflow-auto">
			<div class="col px-5 mt-1 mb-2">
				<table class="table table-hover text-center">
					<thead id="encabezadosDeTabla">
						<tr>
							<!--  -->
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	
	<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>