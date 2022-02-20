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
		<link rel="stylesheet" href="/assets/css/styleindex.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<section class="d-flex justify-content-center bg-white mb-5 pb-4" style="border-radius: 0px 0px 25px 25px" >
			<div class="row col-12 justify-content-center">
				<c:forEach items="${product}" var="prod">
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
	</body>
</html>