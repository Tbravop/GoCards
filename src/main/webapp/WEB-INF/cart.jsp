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
			<title>Carrito de compras</title>
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
            	<div class="container">

				<!-- Page Heading -->
      			<h1 class="mt-4 mb-3">
        			Spring eCommerce <small>Carrito</small>
		        </h1>
		        <ol class="header">
			        <button class=" fas fa-house-chimney fa-2x p-1 text-white" data-bs-toggle="modal" data-bs-target="#exampleModal" style="border-style: none;background-color: #312783;">
						<li class="header-item"><a href="index.html">Home</a></li>
					</button>
						<li class="header-item active">Carrito</li>
					
			    </ol>
			    <!--Shopping table  -->
			    <div class="card mb-4">
			      <div class="card-body">
			        <div class="row">
			         <div class="col-lg-9">
			          <table class="table">
			            <thead>
			              <tr>
			                <th scope="col">Producto</th>
			                <th scope="col">Precio</th>
			                <th scope="col">Cantidad</th>
			                <th scope="col">Total</th>
			                <th scope="col">Acción</th>
			              </tr>
			            </thead>
			            <tbody>
			              <tr>
			                <td >Nombre</td>
			                <td >Precio</td>
			                <td>Cantidad</td>
			                <td >Total</td>
			                <td><a href="#" class="btn btn-danger"><i class="fa-solid fa-trash">Quitar</i></a></td>
			              </tr>
			            </tbody>
			          </table>
			        </div>
			        
			        <div class="col-lg-3">
            			<h2 class="card-title">SUBTOTAL</h2>
			          		
    					<ul class="list-group">
			              <li class="list-group-item"><h5>Total: $ 1000</h5></li>
			              <a href="resumenorden.html" class="btn btn-dark">Ver Orden</a>
			            </ul>
			          </div>
			
			        </div>
			      </div>
			    </div>        		
	</body>
	</html>