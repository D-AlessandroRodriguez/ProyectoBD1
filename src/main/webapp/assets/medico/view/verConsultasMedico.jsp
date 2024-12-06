<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ver: Consultas</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/viewInteractionMedico-style.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.min.css">
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
			    		<li class="breadcrumb-item active" aria-current="page">Crear consulta</li>
			    	</ol>
			    </div>
		</nav>
		<!-- Página principal -->
		<div class="modal modalViewVer" tabindex="-1">
				<div class="modal-dialog modal-xl">
			      <div class="modal-content">
			        <div class="modal-header">
			          <h5 id="title" class="modal-title">Paciente: Jesús Zepeda</h5>
			          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			        </div>
			        <div class="modal-body">
					<div id="bodyModalVer" class="ratio"
						style="--bs-aspect-ratio: 0; margin: 10px"></div>
					<!--valores dentro del cuerpo -->
					<table class="table">
						<thead>
							<tr>
								<th scope="col">fecha: 2024/11/27</th>
								<th scope="col">hora: 15:00</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><h5>Diagnostico</h5>
									<div id="" class="container">
										<h6>Observaciones:</h6>
										<p>El paciente presenta enfermedadades base como ser diabates, azucar, presion y 
										se remitio por un dolor de cebeza</p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			        <div class="modal-footer">
			          <button type="button" id="exitModal" class="btn btn-secondary" data-bs-dismiss="modal">Salir</button>
			        </div>
			      </div>
			  </div>
		  </div>
		
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row">
				<h3 class="pt-3">Consultas registradas</h3>
			</div>
			<div id="tablaRowContainer" class="row overflow-auto">
				<div class="col px-5 mt-1 mb-2">
					<table  id="consultasTable" class="table table-hover text-center">
						<thead id="encabezadosDeTabla">
							<tr>
								<th scope="col">Numero consulta</th>
								<th scope="col">Nombre Paciente</th>
								<th scope="col">Fecha</th>
								<th scope="col">Accion</th>
								<th scope="col">Generar receta</th>
							</tr>
						</thead>
						<tbody id="bodyTableConsultas">
						</tbody>
					</table>
				</div>
			</div>
		</div>

	
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.min.js"></script>
		
		<script src="../js/verConsultaMedico/ActionConsultas.js"></script>
		
		<script src="../js/verConsultaMedico/main.js"></script>
		<script src="../js/verConsultaMedico/ActionBtnVer.js"></script>
		<script src="../js/verConsultaMedico/mainBtnVer.js"></script>
	</body>
</html>