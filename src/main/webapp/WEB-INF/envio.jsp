<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<link rel="stylesheet" href="/assets/css/cartstyle.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<title>Envío</title>
</head>
<body>
	<!-- NavBar -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top"
		style="background-color: #312783;">
		<div class="container-fluid col-12">
			<a href="/"> <img src="/assets/img/logo.png" width="120"
				height="40">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse pt-1"
				id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item px-5 d-none d-lg-block">
						<div class="d-flex">
							<input id="search" class="form-control me-2"
								style="width: 500px;" type="search"
								placeholder="Buscar una carta" aria-label="Search">
							<button onclick="boton()" class="btn btn-outline-info"
								type="submit">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</li>
					<li class="nav-item">
						<div class="d-flex d-lg-none pt-2">
							<input id="search" class="form-control me-2"
								style="width: 300px;" type="search"
								placeholder="Buscar una carta" aria-label="Search">
							<button onclick="boton()"
								class="btn btn-outline-success my-2 my-sm-0" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle active" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> MarketPlace </a>
						<ul class="dropdown-menu bg-white"
							style="background-color: white;" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#LoMasVendido">Lo más
									Vendido</a></li>
							<li><a class="dropdown-item" href="#OfertasDestacadas">Ofertas
									Destacadas</a></li>
							<li><a class="dropdown-item" href="#LoNuevo">Lo nuevo</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Bases</a></li>
							<li><a class="dropdown-item" href="#">Productos Sellados</a></li>
							<li><a class="dropdown-item" href="#">Lotes</a></li>
						</ul></li>
					<li class="nav-item"><c:if test="${currentUser == null}">
							<a class="nav-link active" href="/goLogin">Ir a Comunidad</a>
						</c:if> <c:if test="${currentUser != null}">
							<a class="nav-link active" href="/foro">Ir a Comunidad</a>
						</c:if></li>
					<li class="nav-item"><c:if test="${currentUser == null}">
							<a class="nav-link active" href="/goLogin">Vender</a>
						</c:if> <c:if test="${currentUser != null}">
							<a class="nav-link active" href="/crear">Vender</a>
						</c:if></li>
				</ul>
				<div class="dropdown">
					<a href="#"
						class="fas fa-user fa-2x p-1 text-white d-block text-decoration-none link-dark dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false"></a>
					<ul class="dropdown-menu text-small"
						aria-labelledby="dropdownUser1">
						<c:if test="${currentUser == null}">
							<li><a class="dropdown-item" href="/goLogin">Iniciar
									sesión</a></li>
							<li><a class="dropdown-item" href="/registration">Registrate</a></li>
						</c:if>
						<c:if test="${currentUser != null}">
							<form class="dropdown-item" id="logoutForm" method="POST"
								action="/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="submit"
									value="Cerrar sesión" style="border: none; background: none;" />
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
	<!-- TimeLiner -->
	<div class="d-flex container justify-content-center">
		<div class="container">
			<div class="platform-tour-wrapper py-3">
				<!-- TimeLiner2 -->
				<ol class='timeline justify-content-around border-0 horizontal'>
					<li class='active'><a class="nav-link active"
						data-toggle="tab"> </a>
						<h4 class="text-center mt-1">Carro</h4></li>
					<li class='active'><a class="nav-link" data-toggle="tab"></a>
						<h4 class="text-center mt-1">Envio</h4></li>
					<li class='active'><a class="nav-link" data-toggle="tab"></a>
						<h4 class="text-center mt-1">Pago</h4></li>
				</ol>
			</div>
		</div>
	</div>
	<!-- Form-Row -->
	<form>
		<div class="d-flex container justify-content-center mb-5 mt-3">
			<div class="card col-9 p-3">
				<div class="table-responsive">
					<div class="form-row d-inline">
						<div class="col-5 d-inline-block me-2">
							<label for="inputName">Nombre:</label> <input type="text"
								class="form-control" placeholder="Nombre">
						</div>
						<div class="col-5 d-inline-block">
							<label for="inputLastName">Apellido:</label> <input type="text"
								class="form-control" placeholder="Apellido">
						</div>
						<div class="form-group col-md-5 d-inline-block">
							<label for="inputEmail4">Email:</label> <input type="email"
								class="form-control" id="inputEmail4" placeholder="Email">
						</div>
					</div>
					<div class="form-group col-md-5 d-inline-block">
						<label for="inputCelular">Número:</label> <input type="text"
							class="form-control" id="inputAddress2" placeholder="+569...">
					</div>
					<div class="form-row">
						<div class="form-group col-md-4">
							<label for="inputRegion">Región:</label> <select id="inputRegion"
								class="form-control">
								<option selected>Selecciona tu Región:</option>
								<option>Tarapacá</option>
								<option>Antofagasta</option>
								<option>Atacama</option>
								<option>Coquimbo</option>
								<option>Valparaíso</option>
								<option>O'Higgins</option>
								<option>Maule</option>
								<option>Biobío</option>
								<option>La Araucanía</option>
								<option>Los Lagos</option>
								<option>Aysén</option>
								<option>Magallanes</option>
								<option>Santiago</option>
								<option>Los Ríos</option>
								<option>Arica y Parinacota</option>
								<option>Ñuble</option>
							</select>
						</div>
						<div class="form-group col-md-6 d-inline-block">
							<label for="inputAddress">Dirección:</label> <input type="text"
								class="form-control" id="inputAddress" placeholder="...">
						</div>
						<div class="form-group col-md-4 d-inline-block">
							<label for="inputCity">Ciudad:</label> <input type="text"
								class="form-control" id="inputCity" placeholder="...">
						</div>
					</div>
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> Quiero
								recibir correos de las nuevas Ofertas </label>
						</div>
					</div>
					<a href="/pagar"
						class="btn btn-out btn-primary btn-square btn-main mt-2"
						style="background-color: #4B98E0 !important" data-abc="true">Pagar</a>
				</div>
			</div>
		</div>
	</form>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="/assets/js/api.js" type="module"></script>
	<script type="text/javascript">
		function boton() {
			let search = document.getElementById("search").value;
			window.location = "/buscar/" + search;
		}
	</script>
</body>
</html>