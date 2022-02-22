<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
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
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<title>Creando producto</title>
</head>
<body>
	<!-- NavBar -->
	<nav class="navbar navbar-expand-lg navbar-dark"
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
						<form class="d-flex">
							<input class="form-control me-2" style="width: 500px;"
								type="search" placeholder="Buscar una carta" aria-label="Search">
							<button class="btn btn-outline-info" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</form>
					</li>
					<li class="nav-item">
						<form class="d-flex d-lg-none pt-2">
							<input id="search" class="form-control me-2"
								style="width: 300px;" type="search"
								placeholder="Buscar una carta" aria-label="Search">
							<button onclick="boton()"
								class="btn btn-outline-success my-2 my-sm-0" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</form>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle active" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"> MarketPlace </a>
						<ul class="dropdown-menu bg-white"
							style="background-color: white;" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Lo más Vendido</a></li>
							<li><a class="dropdown-item" href="#">Ofertas Destacadas</a></li>
							<li><a class="dropdown-item" href="#">Lo nuevo</a></li>
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
	<div class="card mb-4">
		<div class="card-body">
			<div class="row">
				<div class="col-lg-6">
					<a href="#"> <img class="img-fluid rounded"
						src="/assets/img/unknown.jpg" alt=""></a>
				</div>
				<div class="col-lg-6">
					<form action="/addCart" method="POST">
					<input type="hidden" value="${product.id}" name="id"/>
						<h2 class="card-title">
							<c:out value="${product.name}" />
						</h2>
						<ul class="list-group">
							<li class="list-group-item"><h5>
									Precio:
									<c:out value="${product.price}" />
								</h5></li>
							<li class="list-group-item">
								<p>
									Descripción:
									<c:out value="${product.description}" />
								</p>
							</li>
							<li class="list-group-item">
								<p>
									Cantidad disponible:
									<c:out value="${product.cantidad}" />
								</p>
							</li>
							<li class="list-group-item"><h6>
									Cantidad: <input type="number" id="cantidad" name="cantidad"
										autocomplete="off" min="1" max="5" value="1">
								</h6></li>
						</ul>
						<button type="submit" class="btn btn-dark">Añadir al
							carrito</button>
						<c:if test="${currentUser.id == product.user.id}">
							<a class="btn btn-dark"
								style="background-color: #4B98E0; font-weight: 600;"
								href="/edit/<c:out value="${product.id}"/>">editar</a>
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
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
</body>
</html>