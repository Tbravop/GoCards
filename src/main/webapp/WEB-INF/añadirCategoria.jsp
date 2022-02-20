<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="es">
	<head>
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">		
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">		
		<link rel="stylesheet" href="/assets/css/styleindex.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 	
		<title>GoCards</title>
	</head>
	<body>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #312783;">
        <div class="container-fluid col-12">
         <a href="/">
	      	<img src="/assets/img/logo.png" width="120" height="40">
	      	</a>  
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse pt-1" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item px-5 d-none d-lg-block">
		 		<form class="d-flex">
			        <input class="form-control me-2" style="width: 500px;" type="search" placeholder="Buscar una carta" aria-label="Search">
			        <button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
		      	</form>	      	
              </li>
              <li class="nav-item">
		 		<form class="d-flex d-lg-none pt-2">
			        <input id="search" class="form-control me-2" style="width: 300px;" type="search" placeholder="Buscar una carta" aria-label="Search">
			        <button onclick="boton()" class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
		      	</form>	      	
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  MarketPlace
                </a>
                <ul class="dropdown-menu bg-white" style="background-color: white;" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="#">Lo más Vendido</a></li>
                  <li><a class="dropdown-item" href="#">Ofertas Destacadas</a></li>
                  <li><a class="dropdown-item" href="#">Lo nuevo</a></li>                  
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Bases</a></li>
                  <li><a class="dropdown-item" href="#">Productos Sellados</a></li>
                  <li><a class="dropdown-item" href="#">Lotes</a></li>                                                                                      
                </ul>
              </li>                            
              <li class="nav-item">
               <c:if test="${currentUser == null}"><a class="nav-link disabled" href="/foro">Ir a Comunidad</a></c:if>
               <c:if test="${currentUser != null}"><a class="nav-link active" href="/foro">Ir a Comunidad</a></c:if>  
              </li>
               <li class="nav-item">
               <c:if test="${currentUser == null}"><a class="nav-link disabled" href="/crear">Vender</a></c:if>
               <c:if test="${currentUser != null}"><a class="nav-link active" href="/crear">Vender</a></c:if>               
              </li>        
            </ul>
            <div class="dropdown">
      		<a href="#" class="fas fa-user fa-2x p-1 text-white d-block text-decoration-none link-dark dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"></a>
		    <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
		    	<c:if test="${currentUser == null}"><li><a class="dropdown-item" href="/goLogin">Iniciar sesión</a></li> 
		    		<li><a class="dropdown-item" href="/registration">Registrate</a></li></c:if>
		    	<c:if test="${currentUser != null}">
			    	<form class="dropdown-item" id="logoutForm" method="POST" action="/logout">
					        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					        <input type="submit" value="Cerrar sesión" style="border:none; background: none;"/>
					</form>
					<a class="dropdown-item" href="/sells">Ventas</a>
			    </c:if>
			</ul>
		    </div>  
			<a href="/carrito" class="d-flex" style="text-decoration: none;">
      		<i class="fas fa-shopping-cart fa-2x p-1 text-white ms-3"></i>
      		<p class="text-white d-none d-lg-block">Carrito</p>
      		</a>            
          </div>
         </div>
      </nav>	
      <section class="mt-5 pb-5 bg-white">
		<div class="container col-10 bg-white" style="padding-top: 125px;">
		<h1>Tu producto <c:out value="${product.name}"/> esta apunto de ser creado</h1>
		<p>Es necesario agregarle una categoria a tu producto para facilitar su buscqueda al comprador en el marketplace.</p>
			<section>
				<ul>
					<c:forEach items="${product.categories}" var="lst">
						<li><c:out value="${lst.name}"/></li>
					</c:forEach>
				</ul>
			</section>
			<div class="col-6">
		       	<h4>Agrega una categoria: </h4>
		       	<form action="/anadirCategorias/<c:out value="${product.id}"/>" method="POST">
		        	<select style="width: 200px;" class="custom-select" id="inputGroupSelect01" name="idC">
		            	<option selected>Selecciona...</option>
		               	<c:forEach items="${lista}" var="category">
		           			<option Value="<c:out value="${category.id}"/>"><c:out value="${category.category}"/></option>
		               	</c:forEach>
		        	</select>
		       		<input class="btn btn-primary" type="submit" value="Add"/>
		        </form>
	       </div>
	      </div>
	</section>
	<!-- Footer -->
<div class="container-fluid col-12" style="background-color: #131313;">
  <footer class="container-fluid col-10 pt-5 pb-1 text-white">
    <div class="row">
      <div class="col-2 pb-5">
        <h4>Secciones</h4>
        <ul class="nav flex-column text-white">
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Inicio</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Marketplace</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Comunidad</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Cuenta</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">FAQs</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-white">Sobre nosotros</a></li>          
        </ul>
      </div>
      <div class="col-6 offset-1">
        <form>
          <h5>Suscribete para recibir todas las novedades</h5>
          <p>Mensualmente te llegaran mensajes con lo mas destacado.</p>
          <div class="d-flex w-100 gap-2">
            <label for="newsletter1" class="visually-hidden">Email address</label>
            <input id="newsletter1" type="text" class="form-control" placeholder="Escribe tu Email">
            <button class="btn btn-primary" type="button">Suscribete</button>
          </div>
        </form>
      </div>
    </div>
            <div class="alinear container col-10">
            <div class="row">
                <div class="container col-md-5 text-start pb-1"> 
      			<p>2022 GoCards, Inc. Todos los derechos reservados.</p>
                </div>
                <div class="container col-md-5 text-end">
                    <a href="https://twitter.com"><i class="fab fa-twitter-square fa-2x p-1 text-white" data-bs-toggle="tooltip" data-bs-placement="top" title="Twitter"></i></a>
                    <a href="https://facebook.com"><i class="fab fa-facebook-square fa-2x p-1 text-white" data-bs-toggle="tooltip" data-bs-placement="top" title="Facebook"></i></a>
                </div>
            </div>
        </div>
  </footer>
 </div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>