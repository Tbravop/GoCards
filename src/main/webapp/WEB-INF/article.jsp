<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	   	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">		
		<link rel="stylesheet" href="/assets/css/style.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 
		<title>Comunidad</title>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #312783;">
        <div class="container-fluid col-12">
        <a href="/"><img src="/assets/img/logo.png" width="120" height="40"></a> 
		<h1>Crear post</h1>
		<a href ="/foro"> Volver al foro</a>	
		</div>
		</nav>
		<form:form action="/foro/new" method="POST" modelAttribute="articulo">
			<form:label path="title">Titulo:</form:label>
			<form:input path="title"/>
			<form:label path="body">Descripción:</form:label>
			<form:input path="body"/>
			<input type="submit" value="Crear"/>
		</form:form>
	</body>
</html>