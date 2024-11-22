<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Registrar salida extraordinaria</title>
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
			            <li><a class="dropdown-item" id="registrarLotesMenu" href="viewRegistrarLote.jsp">Lotes de Productos</a></li>
			          </ul>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle link-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            Otros
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" id="registrarEntradaExtraordinariaMenu" href="viewRegistrarEntradaExtra.jsp">Registrar entrada extraordinaria</a></li>
			            <li><a class="dropdown-item active" id="registrarSalidaExtraordinariaMenu" href="#">Registrar salida extraordinaria</a></li>
			            <li><a class="dropdown-item" id="verHistorialEntradasSalidasMenu" href="viewEntradasSalidas.jsp">Ver historial de entradas y salidas</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    <div>
			    	<ol class="breadcrumb mb-0">
				    	<li class="breadcrumb-item"><a class="link-light" href="mainViewFarmacia.jsp">Farmacia</a></li>
				    	<li class="breadcrumb-item active" aria-current="page">Registro de salida extraordinaria</li>
				    </ol>
			    </div>
			</div>
		</nav>
		<!-- Página principal -->
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row">
				<h3 class="pt-3">Registro de salida extraordinaria de producto</h3>			
			</div>
			<div id="datosProductoRowContainer" class="row">
				<form class="py-3 px-5 border border-light-subtle rounded-3">
					<fieldset>
						<legend>Identificación del producto</legend>
						<div class="row mb-3">
							<div class="col col-3">
								<label for="idProductoInput" class="form-label">Id de Producto</label>
								<input class="form-control" list="listaDeIdsProductos" id="idProductoInput" placeholder="Id del producto para buscar..." required>
								<datalist id="listaDeIdsProductos">
									<!-- Filtración de ids se traen desde la base de datos -->
								    <option value="P-20241122142345765">
								    <option value="P-20241122142345765">
								    <option value="P-20241122142345765">
								    <option value="P-20241122142345765">
								    <option value="P-20241122142345765">
								    <option value="P-20241122142345765">
								    <option value="P-20241122142345765">
								</datalist>
							</div>
							<div class="col col-6">
								<label for="nombreProductoInput" class="form-label">Nombre producto</label>
								<!-- Nombre del producto se trae de la base de datos de acuerdo al id buscado del producto anterior -->
								<input type="text" id="nombreProductoInput" class="form-control" placeholder="Busca el id de producto para ver su nombre" disabled required>
							</div>
							<div class="col col-3">
								<label for="loteSelect" class="form-label">Lote</label>
								<select id="loteSelect" class="form-select" required>
									<!-- Lotes del producto se traen de la base de datos -->
									<option value="" selected>Selecciona</option>
									<option value="Id del lote...">P-20241122142345765</option>
									<option value="Id del lote...">P-20241122142345765</option>
									<option value="Id del lote...">P-20241122142345765</option>
									<option value="Id del lote...">P-20241122142345765</option>
									<option value="Id del lote...">P-20241122142345765</option>
									<option value="Id del lote...">P-20241122142345765</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col col-4">
								<label for="tipoProductoInput" class="form-label">Tipo de Producto (Presentación)</label>
								<!-- Tipo de producto se trae de la base de datos de acuerdo al id buscado del producto -->
								<input type="text" id="tipoProductoInput" class="form-control" placeholder="Busca el id de producto para ver su tipo" disabled required>
							</div>
							<div class="col col-4">
								<label for="tipoMovimientoSelect" class="form-label">Motivo de salida</label>
								<select id="tipoMovimientoSelect" class="form-select" required>
									<!-- Movimientos se traen de la base de datos -->
									<option value="" selected>Selecciona</option>
									<option value="TipoMovimiento1">Producto dañado</option>
									<option value="TipoMovimiento2">Producto robado</option>
									<option value="TipoMovimiento3">Producto vencido</option>
								</select>
							</div>
							<div class="col col-4">
								<label for="cantidadDevolucionInput" class="form-label">Cantidad a devolver</label>
								<input type="number" min="1" class="form-control" id="cantidadDevolucionInput" placeholder="Cantidad" required>
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