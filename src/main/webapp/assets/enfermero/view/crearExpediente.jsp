<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nueva: Expediente</title>
<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/viewInteractionMedico-style.css">

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



	<div class="container border rounded shadow" id="formConsulta"
		style="position: relative; width: 90vw; height: 80vh; display: flex; flex-direction: column;">
		<div class="form-container text-center p-3 border-bottom">
			<h2 class="fw-bold">Nuevo Expediente</h2>
		</div>
		<form
			style="flex: 1; display: flex; flex-direction: column; overflow: hidden;">
			<div class="p-4" id="camposContainer"
				style="flex: 1; overflow-y: auto;">
				<div class="p-4" id="camposContainer"
					style="flex: 1; overflow-y: auto;">

					<div class="row">
						<label for="salario" class="form-label fw-bold">Datos
							personales</label>
					</div>
					<div class=" row mb-3 " id="rowName">
						<div class="col-md-3">
							<label for="Nombre1" class="form-label fw-bold">Nombre 1</label>
							<input type="text" class="form-control" id="Nombre1"
								name="Nombre1" name="Nombre1" required>
						</div>
						<div class="col-md-3">
							<label for="Nombre2" class="form-label fw-bold">Nombre 2</label>
							<input type="text" class="form-control" id="Nombre2"
								name="Nombre2" name="Nombre2" required>
						</div>
						<div class="col-md-3">
							<label for="Apellido1" class="form-label fw-bold">Apellido
								1</label> <input type="text" class="form-control" id="Apellido1"
								name="Apellido1" name="Apellido1" required>
						</div>
						<div class="col-md-3">
							<label for="Apellido2" class="form-label fw-bold">Apellido2</label>
							<input type="text" class="form-control" id="Apellido2"
								name="Apellido2" name="Apellido2" required>
						</div>
					</div>

					<div class="row " id="rowInfo">
						<div class="mb-3 col-md-3">
							<label for="DNIPersona" class="form-label fw-bold  ">DNI</label>
							<input type="text" class="form-control" id="DNIPersona"
								name="DNIPersona" name="DNIPersona">
						</div>
						<div class="mb-3 col-md-3">
							<label for="RTNPersona" class="form-label fw-bold  col-md-6">RTN</label>
							<input type="text" class="form-control" id="RTNPersona"
								name="RTNPersona" name="RTNPersona" placeholder="Opcional"
								required>
						</div>
						<div class="col-md-3">
							<label for="fechaNacimiento" class="form-label fw-bold">Fecha</label>
							<input type="date" class="form-control" id="fechaNacimiento"
								name="fechaNacimiento" name="fecha" required>
						</div>
						<div class="col-md-3 ">
							<label for="sexoPersona" class="form-label fw-bold w-100">sexo</label>

							<select class="form-select" name="sexoPersona" id="sexoPersona"
								aria-label="Default select example" required>
								<option selected>Seleccionar</option>
								<option value="1">Masculino</option>
								<option value="2">Femenino</option>

							</select>


						</div>
					</div>

					<div class="row ">
						<label for="paisDireccion" class="form-label fw-bold w-100">
							Direccion</label>
					</div>
					<div class="row mb-3" id="rowDireccion1">

						<div class="col-md-3 ">
							<label for="paisDireccion" class="form-label fw-bold w-100">Pais</label>


							<select class="form-select" aria-label="Default select example"
								id="pais" name="pais" required>
								<option selected>Seleccionar</option>
								<option value="1">Honduras</option>
								<option value="2">El Salvador</option>

							</select>




						</div>
						<div class="col-md-3 ">
							<label for="departamentoDireccion"
								class="form-label fw-bold w-100">Departamento</label> <select
								class="form-select" id="depto" name="depto"
								aria-label="Default select example" required>
								<option selected>Seleccionar</option>
								<option value="1">Francisco Morazan</option>
								<option value="2">San Salvador</option>

							</select>



						</div>
						<div class="col-md-3 ">
							<label for="ciudadDireccion" class="form-label fw-bold w-100">Ciudad</label>

							<select class="form-select" aria-label="Default select example"
								id="ciudad" name="ciudad" required>
								<option selected>Seleccionar</option>
								<option value="1">Tegucigalpa</option>
								<option value="2">Salvador</option>

							</select>



						</div>
						<div class="col-md-3 ">
							<label for="ColoniaDireccion" class="form-label fw-bold w-100">Colonia</label>
							<select class="form-select" aria-label="Default select example"
								id="colonia" name="colonia" required>
								<option selected>Seleccionar</option>
								<option value="1">hato</option>
								<option value="2">Suyapa</option>

							</select>



						</div>


					</div>


					<div class="row mb-3 " id="rowDireccion2">
						<div class="col-md-12 mb-3">
							<label for="referenciaD" class="form-label fw-bold w-100">Referencia</label>
							<div class="row p-2">
								<textarea class="form-control" name="referenciaD"
									id="referenciaD" rows="2" placeholder="Referencia" required></textarea>
							</div>
						</div>
					</div>

					<div class="row mb-3" id="rowInfoSalud">
						<div class="col-md-3">
							<label for="departamentoDireccion"
								class="form-label fw-bold w-100">Tipo sangre</label> <select
								class="form-select" aria-label="Default select example"
								name="tipoSangreP" id="tipoSangreP" required>
								<option selected>Seleccionar</option>
								<option value="1">A</option>
								<option value="2">B</option>

							</select>


						</div>
						<div class="col-md-3">
							<label for="departamentoDireccion"
								class="form-label fw-bold w-100">Estado</label> <select
								class="form-select" aria-label="Default select example"
								id="estadoPersona" name="estadoPersona" required>
								<option selected>Seleccionar</option>
								<option value="1">1</option>
								<option value="2">2</option>

							</select>


						</div>
					</div>


				</div>



			</div>
			<div class="p-3 border-top text-center" id="botonContainer"
				style="position: sticky; bottom: 0; background-color: white;">
				<button type="button" id="buttonCreate"
					class="btn btn-primary w-100 fw-bold">Registrar Consulta</button>
			</div>
		</form>
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

	<div class="toast" role="alert" aria-live="assertive"
		aria-atomic="true" id="modalError"
		style="position: absolute; top: 11vh; left: 75vw; width: 15vw;">
		<div class="toast-header">
			<strong class="me-auto">Error</strong> <small
				class="text-body-secondary">Ahora</small>
			<button type="button" class="btn-close" data-bs-dismiss="toast"
				aria-label="Close"></button>
		</div>
		<div class="toast-body">
			<h5 id="textError"></h5>
		</div>
	</div>


	<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="../js/Load.js"></script>
	<script src="../js/Validator.js"></script>
	<script src="../js/ErrorToast.js"></script>
	<script src="../js/Action.js"></script>
	<script src="../js/ProcessData.js"></script>
	<script src="../js/main.js"></script>

</body>
</html>