<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Comunidad Go Cards</title>
	</head>
	<body>
		<h1>Comunidad Go Cards</h1>
		<a href ="/foro/new"> Agregar artículo</a>	
		<c:forEach items="${articulos}" var="articulo">
			<a href="/foro/${foro.id}"><c:out value ="${article.title}"/></a>
			<c:out value="${article.body}"/>
		</c:forEach>
	</body>
</html>