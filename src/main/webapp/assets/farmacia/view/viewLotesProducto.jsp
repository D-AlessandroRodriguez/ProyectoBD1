<%@page import="DAO.ProductsDAO"%>
<%@page import="DAO.ProductBatchesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String productId = request.getParameter("prod");
	String productName = new String("No definido");
	
	if (productId != null) {
		
		productName = ProductsDAO.getProductName(productId);
	}
%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lotes de <%=productName%></title>
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/viewLotesProductoStyle.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.min.css">
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
			            <li><a class="dropdown-item active" id="verProductosMenu" href="#">Productos</a></li>
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
			    		<li class="breadcrumb-item"><a class="link-light" href="viewProductos.jsp">Productos</a></li>
			    		<li class="breadcrumb-item active" aria-current="page">Lotes de <%=productName%></li>
			    	</ol>
			    </div>
			</div>
		</nav>
		<!-- Página principal -->
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row">
				<h3 class="pt-3">Lotes de <%=productName%></h3>
			</div>
			<div id="tablaRowContainer" class="row">
				<div class="col px-2 mt-1 mb-2">
					<table id="tablaDeLotes" class="table table-hover text-center">
						<thead id="encabezadosDeTabla">
							<tr>
								<th scope="col">#Lote</th>
								<th scope="col">Cantidad Ingresada</th>
								<th scope="col">Fecha de Ingreso</th>
								<th scope="col">Fecha de Elaboración</th>
								<th scope="col">Fecha de Vencimiento</th>
								<th scope="col">Cantidad Actual</th>
							</tr>
						</thead>
						<tbody>
							<%
							StringBuilder result = new StringBuilder();
							for (int i = 1; i <= 15; i++) {
								result.append("<tr>");
								result.append("<th scope=\"row\">");
								result.append(String.format("<span id=\"numeroLote%sSpan\">%s</span>",i,i));
								result.append("</th>");
								result.append("<td>");
								result.append(String.format("<span id=\"cantIngresada%sSpan\">345</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"fechaIngr%sSpan\">2024-11-20</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"fechaElab%sSpan\">2024-11-20</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"fechaVenc%sSpan\">2024-11-20</span>",i));
								result.append("</td>");
								result.append("<td>");
								result.append(String.format("<span id=\"cantActual%sSpan\">20</span>",i));
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
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
		<script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.min.js"></script>
		<script src="../js/viewLotesProducto/main.js" data-product-id='<%=productId%>'></script>
	</body>
</html>