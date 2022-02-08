<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<meta charset="UTF-8">
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
		<form class="d-flex">
	      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
	    </form>
	    <div>
	    <button class="fas fa-user fa-2x p-1 text-white" data-bs-toggle="modal" data-bs-target="#exampleModal" style="border-style: none;background-color: #312783;">
		</button>
	    <i class="fas fa-shopping-cart fa-2x p-1 text-white"></i>
	    </div>
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
		      </div>
		    </div>
		  </div>
		</div>		  
	</nav>
	<div class="collapse" id="navbarToggleExternalContent">
	  <div class="bg-white p-4" style="width: 300px;background-color: #312783;">
	  <ul class="navbar-nav">
	  	    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Ir a Comunidad</a></li>
	        <li><a class="nav-link" href="#">Categorías Ventas</a></li>
	        <li><a class="nav-link" href="#">Lo Más Vendido</a></li>
	        <li> <a class="nav-link" href="#">Ofertas Destacadas</a></li>
	        <li><a class="nav-link" href="#">Bases</a></li>
	        <li><a class="nav-link" href="#">Productos Sellados</a></li>
	        <li><a class="nav-link" href="#">Lo Nuevo</a></li>
	        <li><a class="nav-link" href="#">Lotes</a></li>
	        <li><a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Vender</a></li> 
        </ul>
	  </div>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>