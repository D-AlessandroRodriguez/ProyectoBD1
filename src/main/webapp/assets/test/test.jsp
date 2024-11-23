<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    String role = (String) session.getAttribute("role");
    if (session == null || session.getAttribute("permissions") == null) {
        // Redirige al login si no hay sesión o permisos
        response.sendRedirect("login.jsp?error=Session expired or unauthorized");
        return;
    }
    
    // Verificar si el usuario tiene el permiso necesario
    String permissions = (String) session.getAttribute("permissions");
    if (!permissions.contains("ACCESS_MEDICO_PAGE")) { // Cambia por el permiso específico requerido
        // Redirige a una página de acceso denegado
        response.sendRedirect("unauthorized.jsp");
        return;
    }
    %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>hello world</h1>
</body>
</html>