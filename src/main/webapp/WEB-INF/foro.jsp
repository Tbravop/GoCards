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
                			<a class="nav-link" href="/post/new">Crear post</a>
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
					<h1 class="display-1">Comunidad Go Cards</h1>				
			</header>						
							<section class="container my-5 py-5">
							  <div class="card-deck">
							    <div class="card">
							      <img class="card-img-top img-fluid" src="/assets/img/Yugioh.png" alt="personajes principales">
							      <div class="card-block">
							        <h4 class="card-title"> Próximos lanzamientos</h4>
							        <p class="card-text">La pandemia de COVID-19 apenas ha afectado al lanzamiento de nuevos productos de Yu-Gi-Oh!, y aquí te damos un adelanto de los lazamientos especiales...</p>
							        <a class="post " href="/post/1"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							    <div class="card">
							      <img class="card-img-top img-fluid" src="/assets/img/ejemploGocard.jpg" alt="articulos de merchandising">
							      <div class="card-block">
							        <h4 class="card-title">¿Cómo jugar a Yu-Gi-Oh!?</h4>
							        <p class="card-text">Yu-Gi-Oh! es un juego de cartas para dos jugadores en el que existen las siguientes reglas para su formato tradicional...</p>
							       <a class="post" href="/post/2"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							    <div class="card">
							        <img class="card-img-top img-fluid" src="/assets/img/lacartaPoderosa.png" alt="foto de la carta mas cara de YuGiOh">
							      <div class="card-block">
							        <h4 class="card-title">¿Cuál es la carta mas poderosa?</h4>
							        <p class="card-text">Exodia no puede ser negado bajo ninguna circunstancia.No importa la cantidad de monstruos que posea el oponente, ni la cantidad de puntos de vida que queden en batalla...</p>
							        <a class="post" href="/post/3"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							  </div>
							  <div class="card-deck" style="margin-top:30px">
							    <div class="card">
							      <img class="card-img-top img-fluid" src="/assets/img/duelLink.jpg" alt="personajes principales">
							      <div class="card-block">
							        <h4 class="card-title">Master Duel es actualmente uno de los más jugados</h4>
							        <p class="card-text">El juego gratuito de cartas de Konami estableció reglas oficiales, indican que los jugadores pueden ser penalizados si sus prendas “están sucias o huelen mal”...</p>
							        <a class="post" href="/post/4"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							    <div class="card">
							      <img class="card-img-top img-fluid" src="/assets/img/sorpresa2.gif" alt="articulos de merchandising">
							      <div class="card-block">
							        <h4 class="card-title">Sujeto fue expulsado de un torneo de Yu-Gi-Oh! </h4>
							        <p class="card-text">La higiene personal es oficialmente parte del meta del juego de cartas. Los hechos sucedieron en un evento de Analog Sports, uno de los organizadores más importantes de torneos de Yu-Gi-Oh! en Japón...</p>
							       <a class="post" href="/post/5"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							    <div class="card">
							      <img class="card-img-top img-fluid" src="/assets/img/torneo.png" alt="foto de la carta mas cara de YuGiOh">
							      <div class="card-block">
							        <h4 class="card-title">Chile será sede South America World Championship Qualifier</h4>
							        <p class="card-text">"Es un orgullo que Chile haya sido seleccionado por Konami para ser el escenario que coronará al mejor jugador del como en su edición 2019”, comentó Rodrigo Fauré...</p>
							        <a class="post" href="/post/6"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							  </div>
							  <div class="card-deck" style="margin-top:30px">
							    <div class="card">
							      <img class="card-img-top img-fluid" src="/assets/img/lapida.png" alt="personajes principales">
							      <div class="card-block">
							        <h4 class="card-title"> Regalaron una lápida con forma de carta de Yu-Gi-Oh! a su hijo fallecido</h4>
							        <p class="card-text">Una buena forma de honrar los gustos de quien se les adelantó en el camino, este es un caso en el que unos padres hicieron todo lo posible por darle un último gusto a su hijo...</p>
							        <a class="post" href="/post/7"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							    <div class="card">
							      <img class="card-img-top img-fluid" src="/assets/img/CartasVarias.jpg" alt="articulos de merchandising">
							      <div class="card-block">
							        <h4 class="card-title">¿Cómo saber que tan rara es tu carta?</h4>
							        <p class="card-text">Es un término usado en Yu-Gi-Oh! para referirse a todas y cada una de las distintas ediciones de todas las cartas del juego oficial.A una carta se le atribuye una cierta rareza según que características posea. Exploremos todos los terminos que hacen una carta rara...</p>
							       <a class="post" href="/post/8"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							    <div class="card">
							       <img class="card-img-top img-fluid" src="/assets/img/cartaCara.png" alt="foto de la carta mas cara de YuGiOh">
							      <div class="card-block">
							        <h4 class="card-title">Una carta de 13,4 millones de dólares</h4>
							        <p class="card-text">Se trata de un movimiento muy inusual, que marcaría un récord en el mundo de las cartas coleccionables. Esta pieza, Blue-Eyes White Dragon, se había valorado y tasado en varios miles de dólares. Se realizaron más de 2000 ofertas en 24 horas por la subasta de la carta...</p>
							      	 <a class="post" href="/post/9"><input class="btn btn-primary d-flex container justify-content-center" type="submit" value="ver más"/></a>
							      </div>
							    </div>
							  </div>
							  </section>
							  <!-- Footer -->
								<footer class="container-fluid col-12 text-white py-2"
									style="background-color: #131313;">
									<div class="alinear container col-10">
										<div class="row">
											<div class="container col-md-5 text-start">
												<h4>GOCARDS &copy; 2021 Company, Inc</h4>
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
											</div>
										</div>
									</div>
								</footer>

    		<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
   			<script src="js/bootstrap.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>					
	</body>
</html>