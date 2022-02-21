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
		<link rel="stylesheet" href="/assets/css/style.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 	
		<title>GoCards - añadiendo categoria</title>
	</head>
	<body>
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #312783;">
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
      <div class="d-flex justify-content-center mt-5">
		<section class="row">
		<div class="card-body">
		<div class="card">
			<img src="/assets/img/categoria.png" class="card-img-top" alt="...">
            <div class="card-body">
               <h4>Agrega una categoria: </h4>
               <form action="/anadirCategorias/<c:out value="${product.id}"/>" method="POST">
                <select style="width: 200px;" class="custom-select" id="inputGroupSelect01" name="idC">
                    <option selected>Selecciona...</option>
                       <c:forEach items="${lista}" var="category">
                           <option Value="<c:out value="${category.id}"/>"><c:out value="${category.category}"/></option>
                       </c:forEach>
                </select>
                   <input class="btn btn-primary" style="background-color:#4B98E0;font-weight:600;" type="submit" value="Agregar"/>
            </form>
			</div>
		</div>
		</div>
		</section>
	</div>
	<!-- Footer -->
  <footer class="py-3 my-4 pt-5">
    <ul class="nav justify-content-center border-bottom pb-3 fixed-bottom" style="background-color: #131313;">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Comunidad</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Vender</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Marketplace</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    <p class="text-center text-muted fixed-bottom">&copy; 2021 Company, Inc</p>
  </footer>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>