<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Articulos</title>
	</head>
	<body>
		<h1>Crear artículo</h1>
		<form:form action="/foro/new" method="POST" modelAttribute="articulo">
			<form:label path="title">Titulo:</form:label>
			<form:input path="title"/>
			<form:label path="body">Descripción:</form:label>
			<form:input path="body"/>
			<input type="submit" value="Crear"/>
		</form:form>
	</body>
</html>