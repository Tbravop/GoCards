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
			        <input class="form-control me-2" style="width: 300px;" type="search" placeholder="Buscar una carta" aria-label="Search">
			        <button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
		      	</form>	      	
              </li>              
              <li class="nav-item">
                <a class="nav-link" href="/foro">Ir a Comunidad</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  MarketPlace
                </a>
                <ul class="dropdown-menu" style="background-color: white;" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="#">Lo más Vendido</a></li>
                  <li><a class="dropdown-item" href="#">Ofertas Destacadas</a></li>
                  <li><a class="dropdown-item" href="#">Lo nuevo</a></li>                  
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Bases</a></li>
                  <li><a class="dropdown-item" href="#">Productos Sellados</a></li>
                  <li><a class="dropdown-item" href="#">Lotes</a></li>     
                  <li><a class="dropdown-item" href="/crear">Vender</a></li>                                                                                     
                </ul>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="/producto">Vender</a>
              </li>        
            </ul>
			<a href="#" class="d-flex" data-bs-toggle="modal" data-bs-target="#exampleModal" style="text-decoration: none;">
      		<i class="fas fa-user fa-2x p-1 text-white"></i>
				<p class="text-white">Inicia sesión</p>
		    </a>  
			<a href="/carrito" class="d-flex" style="text-decoration: none;">
      		<i class="fas fa-shopping-cart fa-2x p-1 text-white"></i>
      		<p class="text-white">Carrito</p>
      		</a>            
          </div>
         </div>
      </nav>
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
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="margin-top: 55px;">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/assets/img/spyralcarusel.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/assets/img/kaijucarusel.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/assets/img/truedracocarusel.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>