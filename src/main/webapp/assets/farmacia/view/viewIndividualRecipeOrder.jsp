<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Receta #1</title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/viewIndividualRecipeOrderStyle.css">
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
			            <li><a class="dropdown-item" id="registrarSalidaExtraordinariaMenu" href="viewRegistrarSalidaExtra.jsp">Registrar salida extraordinaria</a></li>
			             <li><a class="dropdown-item" id="verHistorialEntradasSalidasMenu" href="viewEntradasSalidas.jsp">Ver historial de entradas y salidas</a></li>
			          </ul>
			        </li>
			      </ul>
			    </div>
			    <div>
			    	<ol class="breadcrumb mb-0">
			    		<li class="breadcrumb-item"><a class="link-light" href="mainViewFarmacia.jsp">Farmacia</a></li>
			    		<li class="breadcrumb-item"><a class="link-light" href="viewRecipeOrders.jsp">Órdenes de Recetas</a></li>
			    		<li class="breadcrumb-item active" aria-current="page">Receta #<span id="numRecetaSpanBreadcrumb">1</span></li>
			    	</ol>
			    </div>
			</div>
		</nav>
		
		<!-- Página principal -->
		<div id="contenedorPrincipal" class="container">
			<div id="infoGeneralRowContainer" class="row">
				<h3 class="pt-3">Orden de receta #<span id="numRecetaSpanMainLabel">1</span></h3>
				<p class="mt-2 fs-5 fw-semibold mb-1">Información General</p>
				<div class="col">
					<p class="fw-semibold mb-0">Paciente: <span id="nombrePacienteRecetaSpan" class="fw-normal">Jesús Zepeda</span></p>
				</div>
				<div class="col text-center">
					<p class="fw-semibold mb-0">Médico: <span id="nombreMedicoRecetaSpan" class="fw-normal">Cesar Cruz</span></p>
				</div>
				<div class="col text-end">
					<p class="fw-semibold mb-0">Fecha: <span id="fechaRecetaSpan" class="fw-normal">2024-11-19</span></p>
				</div>
				<p class="mt-3 fs-5 fw-semibold mb-0">Productos de la receta</p>
			</div>
			<div id="tablaRowContainer" class="row overflow-auto">
				<div class="col px-5 mt-1 mb-2">
					<table class="table table-hover text-center">
						<thead class="encabezadosDeTabla">
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nombre</th>
								<th scope="col">Marca</th>
								<th scope="col">Tipo</th>
								<th scope="col">Cantidad</th>
								<th scope="col">Dosis</th>
							</tr>
						</thead>
						<tbody>
							<!-- Código Java para rellenar de contenido -->
							<!-- Identificación del producto -->
							<!-- P-20241122112754123 -->
							<!-- 19 caracteres -->
							<!-- P-(fechaHoraMinutosSegundosMilisegundos) -->
							<%
							StringBuilder result = new StringBuilder();
							for (int i = 1; i <= 10; i++) {
								result.append("<tr>");
								result.append("<th scope=\"row\">");
								result.append(String.format("<span id=\"idProducto%sSpan\">%s</span>",i,i));
								result.append("</th>");
								result.append("<td>");
								result.append(String.format("<span id=\"nombreProducto%sSpan\">Nombre Producto %s</span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"marcaProducto%sSpan\">Marca Prod%s</span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"tipoProducto%sSpan\">Tipo Prod%s</span>",i,i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"cantidadProductos%sSpan\">3</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"cantDosis%sSpan\">5</span> <span id=\"unidadMedida%sSpan\">ml</span> cada <span id=\"frecuenciaHoras%sSpan\">8</span> horas",i,i,i));
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
		<div id="pieContenedor" class="container">
			<div class="row">
				<div class="col mt-3 text-end">
					<button id="mostrarModalConfirmacionEntregaButton" type="button" class="btn btn-primary">Entregar productos disponibles</button>
					<!-- Botón temporal solo para ver la ventana modal -->
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmacionEntregaModal">
					  Ver
					</button>
				</div>
			</div>
		</div>
		
		<!-- Ventana modal de confirmación de entrega de productos -->
		<div class="modal fade" id="confirmacionEntregaModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
		    	<div class="modal-content">
		        	<div class="modal-header">
		        		<h1 class="modal-title fs-5" id="staticBackdropLabel">Confirmación de entrega</h1>
		        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      		</div>
		      		<div class="modal-body">
		      			<!-- Tabla de productos a entregar -->
						<h6>Productos a entregar:</h6>
						<div class="tablaContenedor">
							<table class="table table-hover text-center">
						        <thead class="table-light encabezadosDeTabla">
							        <!-- Código Java para rellenar de contenido -->
									<!-- Identificación del lote -->
									<!-- L-20241122112754123 -->
									<!-- 19 caracteres -->
									<!-- L-(fechaHoraMinutosSegundosMilisegundos) -->
						            <tr>
						                <th># Producto</th>
						                <th># Lote</th>
						                <th>Nombre</th>
						                <th>Cantidad</th>
						            </tr>
						        </thead>
						        <tbody>
						            <tr>
						                <td>6</td>
						                <td>3</td>
						                <td>Paracetamol Kern Pharma</td>
						                <td>2</td>
						            </tr>
						            <tr>
						                <td>6</td>
						                <td>5</td>
						                <td>Paracetamol Kern Pharma</td>
						                <td>1</td>
						            </tr>
						            <tr>
						                <td>7</td>
						                <td>4</td>
						                <td>Nombre producto 7</td>
						                <td>2</td>
						            </tr>
						            <tr>
						                <td>8</td>
						                <td>7</td>
						                <td>Nombre producto 8</td>
						                <td>1</td>
						            </tr>
						        </tbody>
						    </table>
						</div>
						<!-- Tabla de productos faltantes -->
						<h6 class="mt-2">Productos faltantes:</h6>
						<div class="tablaContenedor">
						    <table class="table table-hover text-center">
						        <thead class="table-light encabezadosDeTabla">
						            <tr>
						                <th># Producto</th>
						                <th>Nombre</th>
						                <th>Cantidad Faltante</th>
						            </tr>
						        </thead>
						        <tbody>
						            <tr>
						                <td>8</td>
						                <td>Paracetamol Kern Pharma</td>
						                <td>2</td>
						            </tr>
						            <tr>
						                <td>8</td>
						                <td>Paracetamol Kern Pharma</td>
						                <td>2</td>
						            </tr>
						            <tr>
						                <td>8</td>
						                <td>Paracetamol Kern Pharma</td>
						                <td>2</td>
						            </tr>
						            <tr>
						                <td>8</td>
						                <td>Paracetamol Kern Pharma</td>
						                <td>2</td>
						            </tr>
						            <tr>
						                <td>8</td>
						                <td>Paracetamol Kern Pharma</td>
						                <td>2</td>
						            </tr>
						        </tbody>
						    </table>
						</div>
		      		</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
		        		<button type="button" class="btn btn-primary">Confirmar entrega</button>
		      		</div>
		    	</div>
		  	</div>
		</div>
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>