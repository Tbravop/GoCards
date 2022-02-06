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
		<link rel="stylesheet" href="/src/main/resources/static/assets/css/style.css">
		<title>Login y registro</title>
	</head>
	<body>
  	<section class="container xl my-5 mt-5">
		<div class="row">
			<div class="row row-cols-1 row-cols-md-2 g-4">
			  <div class="card-body">
			    <div class="card">
			      <img src="/src/main/resources/static/assets/img/03.png" class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Registrate</h5>
            		<p><form:errors path="user.*"/></p>			        
		            <form:form method="POST" action="/registration" modelAttribute="user">
		                <p>
		                    <form:label class="form-label" path="name">Name:</form:label>
		                    <form:input  class="form-control" path="name"/>
		                </p>
		                 <p>
		                    <form:label class="form-label" path="lastName">Last Name:</form:label>
		                    <form:input class="form-control" path="lastName"/>
		                </p>
		                 <p>
		                    <form:label class="form-label" path="email">Email:</form:label>
		                    <form:input class="form-control" path="email"/>
		                </p>
		                <p>
		                    <form:label class="form-label" path="password">Password:</form:label>
		                    <form:password class="form-control" path="password"/>
		                </p>
		                <p>
		                    <form:label class="form-label" path="passwordConfirm">Password Confirmation:</form:label>
		                    <form:password class="form-control" path="passwordConfirm"/>
		                </p>
		                <input class="btn btn-primary" type="submit" value="Register!"/>
		            </form:form>			        
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card">
			      <img src="..." class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			</div>							
		</div>
	</section>	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
	</body>
</html>