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
	<!-- NavBar -->
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
                  <li><a class="dropdown-item" href="#LoMasVendido">Lo más Vendido</a></li>
                  <li><a class="dropdown-item" href="#OfertasDestacadas">Ofertas Destacadas</a></li>
                  <li><a class="dropdown-item" href="#LoNuevo">Lo nuevo</a></li>                   
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Bases</a></li>
                  <li><a class="dropdown-item" href="#">Productos Sellados</a></li>
                  <li><a class="dropdown-item" href="#">Lotes</a></li>                                                                                      
                </ul>
              </li>                            
              <li class="nav-item">
               <c:if test="${currentUser == null}"><a class="nav-link active" href="/goLogin">Ir a Comunidad</a></c:if>
               <c:if test="${currentUser != null}"><a class="nav-link active" href="/foro">Ir a Comunidad</a></c:if>  
              </li>
               <li class="nav-item">
               <c:if test="${currentUser == null}"><a class="nav-link active" href="/goLogin">Vender</a></c:if>
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
					<a class="dropdown-item" href="/misProductos">Mis Productos</a>
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
<!--  -->
<div id="LoMasVendido" class="d-flex justify-content-center mt-4" style="background-color: #312783;border-radius: 9px;">
      <h1 class="text-center mt-1 py-2 text-white">Lo más vendido</h1>
</div>
<!--  -->
<section class="d-flex justify-content-center bg-white mb-5 pb-4" style="border-radius: 0px 0px 25px 25px" >
<div class="row col-12 justify-content-center">
	<c:forEach items="${products}" var="prod">
	<div class="col-6 col-xl-4 mt-5" style="max-width: 18rem;">
			<div class="card shadow-lg bg-body rounded">
		  <img class="card-img-top" src="/assets/img/unknown.jpg">
		  <div class="card-body">
		    <h3 class="card-title"><a href="/producto/<c:out value="${prod.id}"/>"><c:out value="${prod.name}"/></a></h3>
		    <p class="card-text">Envío gratis</p>
		    <h2 class="" style="font-weight:700;font-size: 15px;">CLP <c:out value="${prod.price}"/></h2>
		  </div>
		</div>
	</div>	
	</c:forEach>
	<div class="d-flex justify-content-center">
	<button type="button" class="btn mt-5 text-white py-3 px-5" style="background-color: #4B98E0;font-weight:600;width:500px;">Ver más</button>	
	</div>
	<button type="button" class="btn mt-5 text-white d-lg-none" style="background-color: #4B98E0;width:225px;font-weight:600;">Ver más</button>
</div>
</section>
<!--  -->
<div id="OfertasDestacadas" class="d-flex justify-content-center mt-4" style="background-color: #312783;border-radius: 9px;">
      <h1 class="text-center mt-1 py-2 text-white">Ofertas Destacadas</h1>
</div>
<!--  -->
<section class="d-flex justify-content-center bg-white mb-5 pb-4" style="border-radius: 0px 0px 25px 25px" >
<div class="row col-12 justify-content-center">
	<c:forEach items="${products}" var="prod">
	<div class="col-6 col-xl-4 mt-5" style="max-width: 18rem;">
			<div class="card shadow-lg bg-body rounded">
		  <img class="card-img-top" src="/assets/img/unknown.jpg">
		  <div class="card-body">
		    <h3 class="card-title"><a href="/producto/<c:out value="${prod.id}"/>"><c:out value="${prod.name}"/></a></h3>
		    <p class="card-text">Envío gratis</p>
		    <h2 class="" style="font-weight:700;font-size: 15px;">CLP <c:out value="${prod.price}"/></h2>
		  </div>
		</div>
	</div>	
	</c:forEach>
	<div class="d-flex justify-content-center">
	<button type="button" class="btn mt-5 text-white py-3 px-5" style="background-color: #4B98E0;font-weight:600;width:500px;">Ver más</button>	
	</div>
	<button type="button" class="btn mt-5 text-white d-lg-none" style="background-color: #4B98E0;width:225px;font-weight:600;">Ver más</button>
</div>
</section>
<!--  -->
<div id="LoNuevo" class="d-flex justify-content-center mt-4" style="background-color: #312783;border-radius: 9px;">
      <h1 class="text-center mt-1 py-2 text-white">Lo nuevo</h1>
</div>
<!--  -->
<section class="d-flex justify-content-center bg-white pb-4" style="border-radius: 0px 0px 25px 25px" >
<div class="row col-12 justify-content-center">
	<c:forEach items="${newest}" var="prod">
	<div class="col-6 col-xl-4 mt-5" style="max-width: 18rem;">
			<div class="card shadow-lg bg-body rounded">
		  <img class="card-img-top" src="/assets/img/unknown.jpg">
		  <div class="card-body">
		    <h3 class="card-title"><a href="/producto/<c:out value="${prod.id}"/>"><c:out value="${prod.name}"/></a></h3>
		    <p class="card-text">Envío gratis</p>
		    <h2 class="" style="font-weight:700;font-size: 15px;">CLP <c:out value="${prod.price}"/></h2>
		  </div>
		</div>
	</div>	
	</c:forEach>
	<div class="d-flex justify-content-center">
	<button type="button" class="btn mt-5 text-white py-3 px-5" style="background-color: #4B98E0;font-weight:600;width:500px;">Ver más</button>	
	</div>
	<button type="button" class="btn mt-5 text-white d-lg-none" style="background-color: #4B98E0;width:225px;font-weight:600;">Ver más</button>
</div>
</section>


    <!-- Footer -->
    <footer class="container-fluid col-12 text-white py-2" style="background-color: #131313;">
        <div class="alinear container col-10">
            <div class="row">
                <div class="container col-md-5 text-start"> 
                    <h4>GOCARDS &copy; 2021 Company, Inc</h4>
                </div>                
                <div class="container col-md-5 text-end">
                    <a href="https://github.com"><i class="fab fa-github-square fa-2x p-1 text-white" data-bs-toggle="tooltip" data-bs-placement="top" title="GitHub"></i></a>
                    <a href="https://www.linkedin.com"><i class="fab fa-linkedin fa-2x p-1 text-white" data-bs-toggle="tooltip" data-bs-placement="top" title="Linkedin"></i></a>
                    <a href="https://twitter.com"><i class="fab fa-twitter-square fa-2x p-1 text-white" data-bs-toggle="tooltip" data-bs-placement="top" title="Twitter"></i></a>
                    <a href="https://facebook.com"><i class="fab fa-facebook-square fa-2x p-1 text-white" data-bs-toggle="tooltip" data-bs-placement="top" title="Facebook"></i></a>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="/assets/js/api.js" type="module"></script>
	<script type="text/javascript">
		function boton(){
			let search = document.getElementById("search").value;
			window.location = "/search/"+search;
		}
	</script>
	</body>
</html>