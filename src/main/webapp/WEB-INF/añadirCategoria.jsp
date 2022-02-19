<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang=es>
	<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	</head>
	<body>
		<h1><c:out value="${product.name}"/></h1>
			<h3 Style="margin-top:10px"><a href="http://localhost:8080">Dashboard</a></h3>
			<section>
				<ul>
					<c:forEach items="${product.categories}" var="lst">
						<li><c:out value="${lst.name}"/></li>
					</c:forEach>
				</ul>
			</section>
			<div class="col-6">
		       	<h4>Add Category :</h4>
		       	<form action="/anadirCategorias/<c:out value="${product.id}"/>" method="POST">
		        	<select style="width: 200px;" class="custom-select" id="inputGroupSelect01" name="idC">
		            	<option selected>Choose...</option>
		               	<c:forEach items="${lista}" var="category">
		           			<option Value="<c:out value="${category.id}"/>"><c:out value="${category.category}"/></option>            
		               	</c:forEach>
		        	</select>
		       		<input class="btn btn-primary" type="submit" value="Add"/>
		        </form>
	       </div>
	</body>
</html>