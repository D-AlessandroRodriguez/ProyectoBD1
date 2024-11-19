<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Ver Recetas: Farmacia</title>
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
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Ver
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item active" id="verOrdenesRecetasMenu" href="#">Órdenes de recetas</a></li>
			            <li><a class="dropdown-item" id="verProductosMenu" href="#">Productos</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Registrar
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="registrarProductosMenu" href="#">Productos</a></li>
			            <li><a class="dropdown-item" id="registrarLotesMenu" href="#">Lotes de Productos</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    <div>
			    	<ol class="breadcrumb mb-0">
			    		<li class="breadcrumb-item"><a class="link-light" href="mainViewFarmacia.jsp">Farmacia</a></li>
			    		<li class="breadcrumb-item active" aria-current="page">Órdenes de Recetas</li>
			    	</ol>
			    </div>
			</div>
		</nav>
		<!-- Página principal -->
		<div class="container" style="height: 90vh;">
			<div class="row h-100">
				<div class="col px-5 mt-3 mb-3">
					<h3 class="mt-3">Órdenes de Recetas</h3>
					<table id="tablaRecetas" class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Paciente</th>
								<th scope="col">Médico</th>
								<th scope="col">Fecha</th>
								<th scope="col">Acción</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">
									<span id="numeroReceta1Span">1</span>
								</th>
						        <td>
						        	<span id="primerNombrePacienteReceta1Span">Jesús</span> <span id="primerApellidoPacienteReceta1Span">Zepeda</span>
						        </td>
						        <td>
						        	<span id="primerNombreMedicoReceta1Span">Cesar</span> <span id="primerApellidoMedicoReceta1Span">Cruz</span>
						        </td>
						        <td>
						        	<span id="fechaReceta1Span">2024-11-19</span>
						        </td>
						        <td>
						        	<button type="button" class="btn btn-success w-75" id="verReceta1Button">Ver</button>
						        </td>
						    </tr>
						    <tr>
						        <th scope="row">
									<span id="numeroReceta2Span">2</span>
								</th>
						        <td>
						        	<span id="primerNombrePacienteReceta2Span">Jesús</span> <span id="primerApellidoPacienteReceta2Span">Zepeda</span>
						        </td>
						        <td>
						        	<span id="primerNombreMedicoReceta2Span">Cesar</span> <span id="primerApellidoMedicoReceta2Span">Cruz</span>
						        </td>
						        <td>
						        	<span id="fechaReceta2Span">2024-11-19</span>
						        </td>
						        <td>
						        	<button type="button" class="btn btn-success w-75" id="verReceta2Button">Ver</button>
						        </td>
						    </tr>
						    <tr>
						        <th scope="row">
									<span id="numeroReceta3Span">3</span>
								</th>
						        <td>
						        	<span id="primerNombrePacienteReceta3Span">Jesús</span> <span id="primerApellidoPacienteReceta3Span">Zepeda</span>
						        </td>
						        <td>
						        	<span id="primerNombreMedicoReceta3Span">Cesar</span> <span id="primerApellidoMedicoReceta3Span">Cruz</span>
						        </td>
						        <td>
						        	<span id="fechaReceta3Span">2024-11-19</span>
						        </td>
						        <td>
						        	<button type="button" class="btn btn-success w-75" id="verReceta3Button">Ver</button>
						        </td>
						    </tr>
						  </tbody>
					</table>
				</div>
			</div>
		</div>
		<script src="../js/bootstrap.bundle.min.js"></script>	
	</body>
</html>