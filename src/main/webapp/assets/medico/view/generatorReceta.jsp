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
		<div class="container flex"
			style="position: absolute; top: 12vh; height: 80vh; left: 20vw; width: 60vw;">
			<div class="d-flex flex-row p-3">
				<div class="col-md-3 p-4">
					<div class="row d-flex justify-content-start fw-bold">
						<span style="font-size: 20px">Receta</span>
					</div>
					<img hspace="13px" src="../img/logo-hospital.png" alt="Logo"
						width="35px" height="30px" class="d-inline-block align-text-top">
				</div>

				<div class="col-sm-6 justify-content-center p-4 fw-bold">
					<label class="row justify-content-center text-center">Hospital San Jesus</label>
					<label class="row justify-content-center text-center">Consulta General</label>
					<label class="row justify-content-center text-center" id="nombreDoctor">------</label>
				</div>
			</div>


			<div class="row mb-3 p-2 ">
				<hr class="border-top mb-4 border-black border-2 opacity-75">
				
				<div class="col-4 mb-2">
					<label class="row justify-content-start">Paciente: </label> 
					<input type="text" class="form-control w-100" id="pacienteName"
						placeholder="Escriba el nombre del paciente">
				</div>
				
				<div class="col-md-8 px-2 fw-bold">
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
						nombre de producto</label> <select class="form-select"
						aria-label="Default select example" required>
						<option selected>Seleccionar</option>
						<option value="1">Analgesico</option>
						<option value="2">Antidolor</option>

					</select>

				</div>
				<div class="col-md-3 ">
					<label for="ciudadDireccion" class="form-label fw-bold w-100">Presentación
					</label> <select class="form-select" aria-label="Default select example"
						required>
						<option selected>Seleccionar</option>
						<option value="1">1</option>
						<option value="2">2</option>
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
						Dosis</label> <select class="form-select"
						aria-label="Default select example" required>
						<option selected>Seleccionar</option>
						<option value="1">10 miligramos</option>
						<option value="2">50 miligramos</option>
					</select>
				</div>

				<div class="col-md-3 ">
					<label for="ciudadDireccion" class="form-label fw-bold w-100">
						Frecuencia </label> <select class="form-select"
						aria-label="Default select example" required>
						<option selected>Seleccionar</option>
						<option value="1">10 miligramos</option>
						<option value="2">50 miligramos</option>

					</select>
				</div>
				
				<div class="col">
					<label for="ciudadDireccion" class="form-label fw-bold w-100">
						Unidad medida </label> <select class="form-select"
						aria-label="Default select example" required>
						<option selected>Seleccionar</option>
						<option value="1">10 miligramos</option>
						<option value="2">50 miligramos</option>
					</select>
				</div>
				
								
				<div class="p-3 md-2 text-center" id="botonContainer">
					<div class="col">
						<button type="submit" id="btnRegistrarReceta" class="btn btn-success w-25 fw-bold">Registrar receta</button>
					</div>
				</div>
				
				<div id="tablaRowContainer" class="row">
				<div class="col px-5 mt-1 mb-2">
					<table id="recipeOrdersTable" class="table table-hover">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nombre producto</th>
								<th scope="col">Presentación</th>
								<th scope="col">Cantidad productos</th>
								<th scope="col">Dosis</th>
								<th scope="col">Unidad de medida</th>
								<th scope="col">Frecuencia</th>
								<th scope="col">Duracion dias</th>
							</tr>
						</thead>
						<tbody>
						<% 
							StringBuilder result = new StringBuilder();
							for (int i = 1; i <= 15; i++) {
								result.append("<tr>");
								result.append("<th scope=\"row\">");
								result.append(String.format("<span id=\"numeroReceta%sSpan\">%s</span>",i,i));
								result.append("</th>");
								result.append("<td>");
								result.append(String.format("<span id=\"primerNombrePacienteReceta%sSpan\">parecetamol</span> <span id=\"primerApellidoPacienteReceta%sSpan\"></span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"primerNombreMedicoReceta%sSpan\">cccccc</span> <span id=\"primerApellidoMedicoReceta%sSpan\"></span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"fechaReceta%sSpan\">10g</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"fechaReceta%sSpan\">1</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<a class=\"link-opacity-50-hover\" href=\"viewIndividualRecipeOrder.jsp?ord=%s\">20g</a>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<a class=\"link-opacity-50-hover\" href=\"viewIndividualRecipeOrder.jsp?ord=%s\">2 al dia</a>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<a class=\"link-opacity-50-hover\" href=\"viewIndividualRecipeOrder.jsp?ord=%s\">2 dias</a>",i));
								result.append("</td>");
								result.append("</tr>");
							}
							out.print(result.toString());
							%>
							</tbody>
						</table>
					</div>
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

				<div class="col-md-8 border-buttom pt-1 px-2 fw-bold">
					<label class="row justify-content-end">Tegucigalpa, M.D.C.
						Blvd. Suyapa</label> <label class="row justify-content-end">Contiguo
						a la UNAH</label>
				</div>
			</div>
			<div class="p-3 text-center col-light" id="botonContainer"
				style="position: sticky; bottom: 0;  background-color: white; color: white; height: 10vh ">
				<button id="btngGuardarReceta" type="submit" class="btn btn-primary w-50 fw-bold">Guardar
					receta</button>
			</div>
		</div>
	</div>

	<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>