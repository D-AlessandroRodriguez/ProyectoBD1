<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Registrar lote de producto</title>
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
			            <li><a class="dropdown-item" id="registrarProductosMenu" href="viewRegistrarProducto.jsp">Productos</a></li>
			            <li><a class="dropdown-item active" id="registrarLotesMenu" href="#">Lotes de Productos</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Otros
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="registrarEntradaExtraordinariaMenu" href="viewRegistrarEntradaExtra.jsp">Registrar entrada extraordinaria</a></li>
			            <li><a class="dropdown-item" id="registrarSalidaExtraordinariaMenu" href="viewRegistrarSalidaExtra.jsp">Registrar salida extraordinaria</a></li>
			            <li><a class="dropdown-item" id="verHistorialEntradasSalidasMenu" href="viewEntradasSalidas.jsp">Ver historial de entradas y salidas</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    <div>
			    	<ol class="breadcrumb mb-0">
			    		<li class="breadcrumb-item"><a class="link-light" href="mainViewFarmacia.jsp">Farmacia</a></li>
			    		<li class="breadcrumb-item active" aria-current="page">Registro de Lote</li>
			    	</ol>
			    </div>
			</div>
		</nav>
		<!-- Página principal -->
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row">
				<h3 class="pt-3">Registro de Lote</h3>		
			</div>
			<div id="datosGeneralesRowContainer" class="row">
				<form class="py-3 px-5 border border-light-subtle rounded-3">
					<fieldset>
						<legend>Información del Lote</legend>
						<div class="row mb-3">
							<div class="col col-6">
								<label for="nombreProductoInput" class="form-label">Producto</label>
								<input class="form-control" list="listaDeProductos" id="nombreProductoInput" placeholder="Escriba el nombre del producto para buscar..." required>
								<datalist id="listaDeProductos">
									<!-- Filtración de productos se traen desde la base de datos -->
								    <option value="NombreProducto1 Marca2 Tipo2">
								    <option value="NombreProducto2 Marca5 Tipo1">
								    <option value="NombreProducto3 Marca7 Tipo4">
								    <option value="NombreProducto4 Marca2 Tipo6">
								    <option value="NombreProducto5 Marca1 Tipo8">
									<option value="NombreProducto6 Marca5 Tipo9">
								</datalist>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col col-6">
								<label for="fechaElabInput" class="form-label">Fecha de Elaboración</label>
								<input type="date" class="form-control" id="fechaElabInput" required>
							</div>
							<div class="col col-6">
								<label for="fechaVencInput" class="form-label">Fecha de Vencimiento</label>
								<input type="date" class="form-control" id="fechaElabInput" required>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-4">
								<label for="cantidadProducto" class="form-label">Cantidad a ingresar</label>
								<input type="number" min="1" class="form-control" id="cantidadProducto" placeholder="Cantidad" required>
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