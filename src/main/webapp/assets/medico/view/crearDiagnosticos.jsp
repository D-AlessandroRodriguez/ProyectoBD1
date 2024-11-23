<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Nuevo: Diagnostico</title>
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
		
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon">botones</span>
			    </button>
			   
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
		<div id="contenedorPrincipal" class="container">
			<div id="tituloRowContainer" class="row">
				
			</div>
			
			<div class="container border rounded  shadown" id="formConsulta "style=" position: absolute;top: 15vh;left: 25vw;width: 50vw;height: 70vh;display: flex;flex-direction: column;">
    <div class="form-container text-center p-3 border-bottom ">
        <h2 class="fw-bold">Diagnostico</h2>
    </div>

    <div class="p-4" id="camposContainer" style="flex: 1;overflow-y: auto;">
        <form>
        
        <div class="mb-3 fs-2">
                <label for="doctor" class="form-label fw-bold">Doctor : </label>
                <label for="doctor" class="form-label fw-bold ">Cesar Cruz</label>
            </div>
            
            <div class="mb-3 fs-2">
                <label for="doctor" class="form-label fw-bold">Paciente : </label>
                <label for="doctor" class="form-label ">Angel Blandin</label>
            </div>
            <div class="mb-3">
                <label for="fecha" class="form-label">Observaciones</label>
                 <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" required></textarea>

            </div>
            <div class="mb-3" style="display: flex; flex-wrap: wrap; gap: 1rem;">
    <div class="col">
        <label for="fecha" class="form-label">Fecha</label>
        <input type="date" class="form-control" id="fecha" name="fecha" required>
    </div>
    <div class="col">
        <label for="hora" class="form-label">Hora</label>
        <input type="time" class="form-control" id="hora" name="hora" required>
    </div>
</div>
            
          
           
        </form>
    </div>

    <div class="p-3 border-top text-center" id="botonContainer" style="position: sticky;bottom: 0;">
        <button type="submit" class="btn btn-primary w-100">Guardar diagnostico</button>
    </div>
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
		
		<div id="pieContenedor" class="container">
			<nav class="p-2">
				<ul class="pagination justify-content-center mb-0">
			    	<li class="page-item disabled">
			        	<a class="page-link">Anterior</a>
			    	</li>
			    	<li class="page-item active" aria-current="page">
			      		<a class="page-link" href="#">1</a>
			    	</li>
			    	<li class="page-item"><a class="page-link" href="#">2</a></li>
			    	<li class="page-item"><a class="page-link" href="#">3</a></li>
			    	<li class="page-item">
			      		<a class="page-link" href="#">Siguiente</a>
			    	</li>
			  	</ul>
			</nav>
		</div>
		<script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>