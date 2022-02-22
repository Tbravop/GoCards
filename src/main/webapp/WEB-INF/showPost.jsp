<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	<%@ page isErrorPage="true" %> 
	
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>	
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
   		<meta http-equiv="X-UA-Compatible" content="IE=edge">			
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">		
		<link rel="stylesheet" href="/assets/css/ForoStyle.css">
		<link rel="stylesheet" href="/assets/css/style.css">		
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 
		
		<title>Comunidad Go Cards</title>
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
			        			<input class="form-control me-2" style="width: 300px;" type="search" placeholder="Buscar una carta" aria-label="Search">
			        			<button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
		      				</form>	      	
              			</li>              
              			<li class="nav-item">
                			<a class="nav-link" href="/foro">Ir a Comunidad</a>
              			</li>
              			<li class="nav-item dropdown">
                			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">MarketPlace</a>
                			<ul class="dropdown-menu" style="background-color: white;" aria-labelledby="navbarDropdown">
			                  	<li><a class="dropdown-item" href="#">Lo más Vendido</a></li>
				                <li><a class="dropdown-item" href="#">Ofertas Destacadas</a></li>
				                <li><a class="dropdown-item" href="#">Lo nuevo</a></li>                  
				                <li><hr class="dropdown-divider"></li>
				                <li><a class="dropdown-item" href="#">Bases</a></li>
				                <li><a class="dropdown-item" href="#">Productos Sellados</a></li>
				                <li><a class="dropdown-item" href="#">Lotes</a></li>                                                                                      
			                </ul>
              			</li>		    
            		</ul>
           			<div class="dropdown">
      					<a href="#" class="fas fa-user fa-2x p-1 text-white d-block text-decoration-none link-dark dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"></a>
		    			<ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
			    			<li><a class="dropdown-item" href="/login">Iniciar sesión</a></li>
			    			<li><a class="dropdown-item" href="/registration">Registrate</a></li>
						</ul>
		    		</div>        
          			</div>
         		</div>
      		</nav>
	      	<header class="d-flex container justify-content-center">
					<h1>Comunidad Go Cards</h1>					
			</header>	
				<div class="container">
					<table class="table table-striped table-hover table-bordered">
						<thead>
							<tr>
								<th>Titulo</th>
								<th>Cuerpo</th>
								<th>Imágen</th>
							</tr>
						</thead>
						<tbody>
					
								<tr>
									<td><c:out value="${article.title}"/></td>
									<td class=""><c:out value="${article.body}"/></td>
									<td class=""><c:out value="${article.imagen}"/></td>
								</tr>						
					
							</tbody>
							</table>
							<a class="post" href="/post/${article.id}/editar"><input class="btn btn-primary" type="submit" value="Editar"/></a>		
							<a class="post" href="/post/${article.id}/comentar"><input class="btn btn-primary" type="submit" value="Comentar"/></a>	
							<c:forEach items="${comentarios}" var="comentario">
								<a href="/post/${comment.id}"></a><c:out value="${comment.text}"/>
						</c:forEach>
						
				</div>
				<section class="container my-5 py-5" action="/post/${article.id}">
							  <div class="card-deck" >
							    <div class="card">
							        <img src="/assets/img/<c:out value="${article.imagen}"/>"/>
							      <div class="card-block">
							        <h4 class="card-title"> <c:out value="${article.title}"/></h4>
							        <p class="card-text"><c:out value="${article.body}"/></p>
							         <div class="form-floating">
								  <textarea class="form-control" placeholder="Comenta aquí" id="floatingTextarea"></textarea>
								  <label for="floatingTextarea">Comenta aquí</label>
								  <button class="btn btn-primary type=submit" >Enviar</button>
								</div>
							        <a class="post" href="/post/${article.id}/editar"><input class="btn btn-primary" type="submit" value="Editar"/></a>		
									<a class="post" href="/post/${article.id}/comentar"><input class="btn btn-primary" type="submit" value="Comentar"/></a>	
							      </div>
							    </div>
				</div>
				</section>	
			
																
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>					
	</body>
</html>