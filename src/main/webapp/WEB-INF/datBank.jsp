<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<form:form class="mb-3" action="/addDatos" method="POST" modelAttribute="bank">
		    <p>
		        <form:label class="form-label" path="rut">Rut</form:label>
		        <form:errors path="rut"/>
		        <form:input  class="form-control" path="rut"/>
		    </p>
		    <p>
		        <form:label  class="form-label" path="numeroDeCuenta">Numero de Cuenta</form:label>
		        <form:errors path="numeroDeCuenta"/>
		        <form:input class="form-control" path="numeroDeCuenta"/>
		    </p>
		    <input class="btn btn-primary" type="submit" value="create"/>
		</form:form>
	</body>
</html>