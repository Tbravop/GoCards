<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<link rel="stylesheet" href="/assets/css/style.css">
		<title>Login y registro</title>
	</head>
	<body>
  	<section class="container xl my-5 pt-5">
		<div class="row">
			<div class="row row-cols-1 row-cols-md-2 g-4">
			  <div class="card-body">
			    <div class="card" style="width: 25rem;">
			      <img src="/assets/img/03.png" class="card-img-top"alt="...">
			      <div class="card-img-overlay">
    				<h1 class="card-title text-white" style="padding-top: 35px;font-size: 50px;">Registrate</h1>
    				</div>
			      <div class="card-body">
            		<p><form:errors path="user.*"/></p>			        
		            <form:form method="POST" action="/registration" modelAttribute="user">
		                <p>
		                    <form:label class="form-label" path="name">Nombre:</form:label>
		                    <form:input  class="form-control" path="name"/>
		                </p>
		                 <p>
		                    <form:label class="form-label" path="lastName">Apellido:</form:label>
		                    <form:input class="form-control" path="lastName"/>
		                </p>
		                 <p>
		                    <form:label class="form-label" path="email">Correo electronico:</form:label>
		                    <form:input class="form-control" path="email"/>
		                </p>
		                <p>
		                    <form:label class="form-label" path="password">Contraseña:</form:label>
		                    <form:password class="form-control" path="password"/>
		                </p>
		                <p>
		                    <form:label class="form-label" path="passwordConfirm">Confirmacion de contraseña:</form:label>
		                    <form:password class="form-control" path="passwordConfirm"/>
		                </p>
		                <input class="btn btn-primary" type="submit" value="Register!"/>
		            </form:form>			        
			      </div>
			    </div>
			  </div>
			  <div class="card-body">
			    <div class="card" style="width: 25rem;">
			      <img src="/assets/img/03.png" class="card-img-top" alt="...">
			      <div class="card-img-overlay">
    				<h1 class="card-title text-white" style="margin-top: 100px;">Registrate</h1>
    				</div>
			      <div class="card-body">
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
			      </div>
			    </div>
			  </div>
			</div>							
		</div>
	</section>	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
	</body>
</html>