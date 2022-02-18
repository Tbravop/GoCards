<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
	       	<form action="/addCat/<c:out value="${product.id}"/>" method="POST">
	        	<select style="width: 200px;" class="custom-select" id="inputGroupSelect01" name="idC">
	            	<option selected>Choose...</option>
	               	<c:forEach items="${lista}" var="category">
	           			<option Value="<c:out value="${category.id}"/>"><c:out value="${category.name}"/></option>            
	               	</c:forEach>
	        	</select>
	       		<input class="btn btn-primary" type="submit" value="Add"/>
	        </form>
       </div>
	</body>
</html>