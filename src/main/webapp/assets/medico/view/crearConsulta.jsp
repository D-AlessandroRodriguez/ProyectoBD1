<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Nueva: Consulta</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/viewInteractionMedico-style.css">
	</head>
	<body>
		<!-- Menú de navegación -->
		<nav class="navbar sticky-top bg-primary navbar-expand-lg" style="height: 10vh;" data-bs-theme="dark">
	<div class="container-fluid">
				<a class="navbar-brand" href="viewMedico.jsp">
					<img src="../img/logo-hospital.png" alt="Logo" width="35px" height="30px" class="d-inline-block align-text-top">
					Hospital San Jesús
				</a>
				<!--hr vertical de boostrap-->
				<div class="vr mx-1" style="color: white; width: 3px;"></div>
				<!--  no se para que-->
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon">botones</span>
			    </button>
			    <!-- nav para tener dentro los botones para interactuar -->
				<div class="collapse navbar-collapse mx-2" id="navbarNavDropdown">
			      <ul class="navbar-nav d-flex gap-2">
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Generar
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="verOrdenesRecetasMenu" href="generatorReceta.jsp">Receta</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Nuevo
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="crearCosulta" href="crearConsulta.jsp">Crear consulta</a></li>
			            <li><a class="dropdown-item" id="crearDiagnostico" href="crearDiagnosticos.jsp">Crear diagnostico</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Existente
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="verConsultas" href="verConsultasMedico.jsp">Ver consultas del medico</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    	<ol class="breadcrumb mb-0">
			    		<li class="breadcrumb-item"><a class="link-light" href="viewMedico.jsp">Medico</a></li>
			    		<li class="breadcrumb-item active" aria-current="page">Crear diagnostico</li>
			    	</ol>
			    </div>
		</nav>
		<!-- Página principal -->
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row"></div>
			<div class="container border rounded  shadown" id="formConsulta "
				style="position: absolute; top: 15vh; left: 25vw; width: 50vw; height: 70vh; display: flex; flex-direction: column;">
				<div class="form-container text-center p-3 border-bottom ">
					<h2 class="fw-bold">Nueva consulta</h2>
				</div>
	
				<div class="p-4" id="camposContainer"
					style="flex: 1; overflow-y: auto;">
					<form>
	
						<div class="mb-3 fs-2 fw-bold">
							<label for="doctor" class="form-label">Doctor : </label> <label
								for="doctor" class="form-label" id="nombreDoctor">Cesar
								Cruz</label>
						</div>
						<div class="mb-3">
							<label for="paciente" class="form-label">Nombre Paciente</label> <input
								type="text" class="form-control" id="paciente" name="paciente"
								required>
						</div>
						<div class="mb-3">
							<label for="fecha" class="form-label">Fecha</label> <input
								type="date" class="form-control" id="fecha" name="fecha" required>
						</div>
						<div class="mb-3">
							<label for="hora" class="form-label">Hora</label> <input
								type="time" class="form-control" id="hora" name="hora" required>
						</div>
	
	
						<div class="mb-3">
							<label for="costo" class="form-label">Costo</label> <input
								type="text" class="form-control" id="costo" name="costo" required>
						</div>
					</form>
				</div>
	
				<div class="p-3 border-top text-center" style="position: sticky; bottom: 0;">
					<button type="submit" class="btn btn-primary w-100" id="btnRegistrarConsulta">Registrar Consulta</button>
				</div>
			</div>
		</div>
		
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../js/crearConsulta/ActionConsulta.js"></script>
		<script src="../js/crearConsulta/main.js"></script>
		
	</body>
</html>