<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">		
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">		
		<link rel="stylesheet" href="/assets/css/style.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 	
		<title>Creando producto</title>
	</head>
	<body>
		<div class="card mb-4">
        	<div class="card-body">
	         	<div class="row">
		            <div class="col-lg-6">
		            	<a href="#"> <img class="img-fluid rounded" src="http://placehold.it/500x325"  alt=""></a>
		            </div>
		            <div class="col-lg-6">
		            	<form action="carrito.html" method="POST">
		                	<h2 class="card-title"><c:out value="${product.name}"/></h2>
		                	<ul class="list-group">
		                  		<li class="list-group-item"><h5>Precio:<c:out value="${product.price}"/></h5></li>
		                  		<li class="list-group-item">
		                    		<p>Descripción:<c:out value="${product.description}"/></p>
		                  		</li>
		                  		<li class="list-group-item">
		                    		<p>Cantidad disponible:<c:out value="${product.cantidad}"/></p>
		                  		</li>
		                  		<li class="list-group-item"><h6>
		                    		Cantidad: <input type="number" id="cantidad" name="cantidad" autocomplete="off"
		                    		min="1" max="5" value="1">
		                  		</h6></li>
		                	</ul>
		                	<button type="submit"  class="btn btn-dark">Añadir al carrito </button>
		                	<c:if test="${currentUser.id == product.user.id}">
		                		<a class="btn btn-dark" style="background-color:#4B98E0;font-weight:600;" href="/edit/<c:out value="${product.id}"/>">editar</a>
		              		</c:if>
		              	</form>
		            </div>
	          	</div>
        	</div>
      	</div>
	</body>
</html>