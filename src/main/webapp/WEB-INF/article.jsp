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
		<link rel="stylesheet" href="/assets/css/PostStyle.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 
		<title>Crear post</title>
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
			        			<input class="form-control me-2" style="width: 500px;" type="search" placeholder="Buscar un post" aria-label="Search">
			        			<button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
		      				</form>	      	
              			</li>
              			<li class="nav-item">
		 					<form class="d-flex d-lg-none pt-2">
						        <input class="form-control me-2" style="width: 300px;" type="search" placeholder="Buscar un post" aria-label="Search">
						        <button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
		      				</form>	      	
              			</li> 
              			<li class="nav-item dropdown">
                			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">MarketPlace</a>
                			<ul class="dropdown-menu" style="background-color: white;" aria-labelledby="navbarDropdown">
			                  	<li><a class="dropdown-item" href="#">Lo m??s Vendido</a></li>
				                <li><a class="dropdown-item" href="#">Ofertas Destacadas</a></li>
				                <li><a class="dropdown-item" href="#">Lo nuevo</a></li>                  
				                <li><hr class="dropdown-divider"></li>
				                <li><a class="dropdown-item" href="#">Bases</a></li>
				                <li><a class="dropdown-item" href="#">Productos Sellados</a></li>
				                <li><a class="dropdown-item" href="#">Lotes</a></li>                                                                                      
			                </ul>
              			</li>             
              			<li class="nav-item">
                			<a class="nav-link" href="/foro">Ir a Comunidad</a>
              			</li>               			        
            		</ul>
            		<div class="dropdown">
      					<a href="#" class="fas fa-user fa-2x p-1 text-white d-block text-decoration-none link-dark dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"></a>
		    			<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
						    <li><a class="dropdown-item" href="/login">Iniciar sesi??n</a></li>
						    <li><a class="dropdown-item" href="/registration">Registrate</a></li>
						</ul>
		    		</div>          
       			</div>
         	</div>
      	</nav>
      	<!-- form -->
      	<header class="d-flex container justify-content-center">
	    	<form:form class="mb-3" action="/post/new" method="POST" modelAttribute="articulo" enctype="multipart/form-data">
	      		<p>
					<form:label path="title">Titulo:</form:label>
					<form:errors path="title"/>
					<form:input class="form-control" path="title"/>
				</p>
				<p>
					<form:label  path="body">Descripci??n:</form:label>
					<form:errors path="body"/>
					<form:input class="form-control" path="body"/>
				</p>
				<p class="upload">
					<label for="customFile" class="form-label">Subir im??genes</label>
					<input class="form-control" type="file" id="customFile" name="file"/>
				</p>
				 <a class="post" href="/foro"><input class="btn btn-primary" type="submit" value="Crear"/></a>
			</form:form>
		</header>
		<!-- Footer -->
		<footer class="container-fluid col-12 text-white py-5"
			style="background-color: #131313;">
			<div class="container col-10">
				<div class="row">
					<div class="container col-md-5 text-start my-1">
						<img src="/assets/img/logo.png" width="180" height="70">
					</div>
					<div class="container col-md-5 text-end">
						<a href="https://github.com"><i
							class="fab fa-github-square fa-2x p-1 text-white"
							data-bs-toggle="tooltip" data-bs-placement="top" title="GitHub"></i></a>
						<a href="https://www.linkedin.com"><i
							class="fab fa-linkedin fa-2x p-1 text-white"
							data-bs-toggle="tooltip" data-bs-placement="top" title="Linkedin"></i></a>
						<a href="https://twitter.com"><i
							class="fab fa-twitter-square fa-2x p-1 text-white"
							data-bs-toggle="tooltip" data-bs-placement="top" title="Twitter"></i></a>
						<a href="https://facebook.com"><i
							class="fab fa-facebook-square fa-2x p-1 text-white"
							data-bs-toggle="tooltip" data-bs-placement="top" title="Facebook"></i></a>
						<h4>&copy; 2021 GoCards, Inc</h4>
					</div>
				</div>
			</div>
		</footer>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</body>
</html>