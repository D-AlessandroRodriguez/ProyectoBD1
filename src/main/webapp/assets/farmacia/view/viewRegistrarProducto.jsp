<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Registro de Producto</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
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
			            <li><a class="dropdown-item" id="verOrdenesRecetasMenu" href="viewRecipeOrders.jsp">Órdenes de recetas</a></li>
			            <li><a class="dropdown-item" id="verProductosMenu" href="viewProductos.jsp">Productos</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Registrar
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item active" id="registrarProductosMenu" href="#">Productos</a></li>
			            <li><a class="dropdown-item" id="registrarLotesMenu" href="viewRegistrarLote.jsp">Lotes de Productos</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Otros
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="registrarEntradaExtraordinariaMenu" href="viewRegistrarEntradaExtra.jsp">Registrar entrada extraordinaria</a></li>
			            <li><a class="dropdown-item" id="registrarSalidaExtraordinariaMenu" href="viewRegistrarSalidaExtra.jsp">Registrar salida extraordinaria</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    <div>
			    	<ol class="breadcrumb mb-0">
			    		<li class="breadcrumb-item"><a class="link-light" href="mainViewFarmacia.jsp">Farmacia</a></li>
			    		<li class="breadcrumb-item active" aria-current="page">Registro de Producto</li>
			    	</ol>
			    </div>
			</div>
		</nav>
		<!-- Página principal -->
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row">
				<h3 class="pt-3">Registro de Producto</h3>			
			</div>
			<div id="datosGeneralesRowContainer" class="row">
				<form class="py-3 px-5 border border-light-subtle rounded-3">
					<fieldset>
						<legend>Datos Generales</legend>
						<div class="row mb-3">
							<div class="col col-7">
								<label for="nombreComercialInput" class="form-label">Nombre comercial</label>
								<input type="text" class="form-control" id="nombreComercialInput" placeholder="Nombre comercial" required>
							</div>
							<div class="col col-5">
								<label for="marcaSelect" class="form-label">Marca</label>
								<select id="marcaSelect" class="form-select" required>
									<!-- Opciones se traen de la base de datos -->
									<option value="" selected>Selecciona</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col col-4">
								<label for="tipoSelect" class="form-label">Tipo de Producto (Presentación)</label>
								<select id="tipoSelect" class="form-select" required>
									<!-- Tipos se traen de la base de datos -->
									<option value="" selected>Selecciona</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
							<div class="col col-4">
								<label for="cantidadDeContenidoInput" class="form-label">Cantidad de contenido</label>
								<input type="text" class="form-control" id="cantidadDeContenidoInput" placeholder="Cantidad" pattern="\d{1,13}(\.\d{1,2})?" required>
							</div>
							<div class="col col-4">
								<label for="unidadDeMedidaSelect" class="form-label">Unidad de medida</label>
								<select id="unidadDeMedidaSelect" class="form-select" required>
								<!-- Unidades de medida se traen de la base de datos -->
									<option value="" selected>Selecciona</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>Clasificación médica del producto (Categorías)</legend>
						<!-- Categorías se traen de la base de datos -->
						<div class="row mb-3">
							<div class="col">
								<div class="form-check">
									<input name="categorias" class="form-check-input" type="checkbox" value="cat1" id="categoria1Check">
								    <label class="form-check-label" for="categoria1Check">Antihistamínico</label>
								</div>
								<div class="form-check">
									<input name="categorias" class="form-check-input" type="checkbox" value="cat4" id="categoria4Check">
								    <label class="form-check-label" for="categoria4Check">Analgésico</label>
								</div>
							</div>
							<div class="col">
								<div class="form-check">
									<input name="categorias" class="form-check-input" type="checkbox" value="cat2" id="categoria2Check">
								    <label class="form-check-label" for="categoria2Check">Expectorante</label>
								</div>
								<div class="form-check">
									<input name="categorias" class="form-check-input" type="checkbox" value="cat5" id="categoria5Check">
								    <label class="form-check-label" for="categoria5Check">Antidepresivo</label>
								</div>
							</div>
							<div class="col">
								<div class="form-check">
									<input name="categorias" class="form-check-input" type="checkbox" value="cat3" id="categoria3Check">
								    <label class="form-check-label" for="categoria3Check">Antitusivo</label>
								</div>
								<div class="form-check">
									<input name="categorias" class="form-check-input" type="checkbox" value="cat6" id="categoria6Check">
								    <label class="form-check-label" for="categoria6Check">Laxante</label>
								</div>
							</div>
						</div>
					</fieldset>
					<div class="row">
						<div class="col text-center">
							<button type="submit" class="btn btn-primary w-25">Registrar</button>	
						</div>
					</div>
				</form>
			</div>
		</div>
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>