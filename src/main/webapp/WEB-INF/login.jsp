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
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">		
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">		
		<link rel="stylesheet" href="/assets/css/style.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 	
		<title>GoCards Login</title>
	</head>
	<body>
		<div class="d-flex container justify-content-center">
			<a href="/">
				<img src="/assets/img/logo.png" style="width: 250px;" class="mt-5 mb-5">
			</a> 
		</div>
		<section class="d-flex justify-content-center">
			<div class="row">
				<div class="row">
					<div class="card-body">
						<div class="card" style="width: 25rem;">
						<img src="/assets/img/03.png" class="card-img-top"alt="...">
						<h1 class="card-title text-white" style="margin-left: 5px; padding-top: 35px;font-size: 50px;margin-top:-127px;margin-bottom:25px;">Inicia Sesión</h1>
							<div class="card-body">
								<c:if test="${logoutMessage != null}">
									<c:out value="${logoutMessage}"></c:out>
								</c:if>
							<c:if test="${errorMessage != null}">
								<c:out value="${errorMessage}"></c:out>
							</c:if>
								<form method="POST" action="/login">
									<p>
										<label class="form-label" for="email">Correo</label>
										<input class="form-control" type="email" id="email" name="username"/>
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
			</div>
		</section>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>		           
	</body>
</html>