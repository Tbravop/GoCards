<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html lang="es">
	<head>
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">		
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">		
		<link rel="stylesheet" href="/assets/css/style.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 	
		<title>GoCards</title>
	</head>
<body>
<nav class="container-fluid navbar navbar-dark" style="height: 80px;background-color: #312783;">
	  <div class="justify-content-start">
	    <button class="navbar-toggler m-2" style="border-style: none;color: #312783;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <a class="navbar-brand" href="/">
	      <img src="/assets/img/logo.png" width="120" height="40">
	    </a>    
	  </div>
	  <!-- Buscador web-->
		<form class="d-flex">
	      <input class="form-control me-2 d-none d-xl-block" style="width: 700px;" type="search" placeholder="Buscar una carta" aria-label="Search">
	      <button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
	    </form>
	    <!-- /// -->
	    <div class="d-flex">
	    <p>Inicia Sesión</p>
	    <button class="fas fa-user fa-2x p-1 text-white" data-bs-toggle="modal" data-bs-target="#exampleModal" style="border-style: none;background-color: #312783;">
		</button>
		<p>Inicia Sesión</p>
	    <i class="fas fa-shopping-cart fa-2x p-1 text-white"></i>
	    </div>

		<!-- Modal login-->
			    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Iniciar sesión</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <c:if test="${logoutMessage != null}">
        			<c:out value="${logoutMessage}"></c:out>
        			</c:if>
            			<h5>Login</h5>
            		<c:if test="${errorMessage != null}">
                	<c:out value="${errorMessage}"></c:out>
            		</c:if>
            		<form method="POST" action="/login">
                		<p>
	                    	<label class="form-label" for="email">Correo</label>
	                    	<input class="form-control" type="text" id="email" name="username"/>
                		</p>
                		<p>
                    		<label class="form-label" for="password">Contraseña</label>
                    		<input class="form-control" type="password" id="password" name="password"/>
                		</p>
                		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                		<input class="btn btn-primary" type="submit" value="Login!"/>
            		</form>
            		<a href="/registration">Registrate</a>
            	<c:if test="${User.getUser != null}">
	            	<form id="logoutForm" method="POST" action="/logout">
		                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		                <input class="btn btn-danger" type="submit" value="Logout!" />
	            	</form>	
            	</c:if>
		      </div>
		    </div>
		  </div>
		</div>	
 
	</nav>
			<!-- Buscador responsivo-->
			<div class="container-fluid navbar navbar-dark d-none d-md-block" style="height: 80px;background-color: #312783;">

			</div>	 
	<div class="collapse" id="navbarToggleExternalContent">
	  <div class="bg-white p-4" style="width: 300px;background-color: #312783;">
	  <ul class="navbar-nav">
	  	    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Ir a Comunidad</a></li>
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown">
            MarketPlace
          </a>
          <ul class="dropdown-menu p-1" aria-labelledby="navbarDropdownMenuLink" style="background-color: white;">
            <li><a class="dropdown-item p-4" href="#">Lo más Vendido</a></li>
            <li><a class="dropdown-item p-4" href="#">Ofertas Destacadas</a></li>
            <li><a class="dropdown-item p-4" href="#">Lo nuevo</a></li>                       
          </ul>
        </li>
	        <li><a class="nav-link" href="#">Bases</a></li>
	        <li><a class="nav-link" href="#">Productos Sellados</a></li>
	        <li><a class="nav-link" href="#">Lotes</a></li>
	        <li><a class="nav-link" href="/crear">Vender</a></li> 
        </ul>
	  </div>
	</div>
<section style="margin-top:40px">
            <form:form  class="mb-3" action="/crear/producto" method="POST" modelAttribute="product">
                <p>
                    <form:label class="form-label" path="name">Nombre del Producto</form:label>
                    <form:errors path="name"/>
                    <form:input  class="form-control" path="name"/>
                </p>
                <p>
                    <form:label class="form-label" path="name">Nombre del Producto</form:label>
                    <form:errors path="name"/>
                    <form:input  class="form-control" path="name"/>
                </p>
                <p>
                    <form:label class="form-label" path="name">Nombre del Producto</form:label>
                    <form:errors path="name"/>
                    <form:input  class="form-control" path="name"/>
                </p>
                <p>
                    <form:label class="form-label" path="name">Nombre del Producto</form:label>
                    <form:errors path="name"/>
                    <form:input  class="form-control" path="name"/>
                </p>
                <input class="btn btn-primary" type="submit" value="crear"/>
            </form:form>
        </section>    
</body>
</html>