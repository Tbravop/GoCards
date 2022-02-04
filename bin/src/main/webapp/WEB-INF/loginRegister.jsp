<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<title>Login and Register</title>
	</head>
	<body>
		<div class="container-fluid col-12 negro pb-5 d-none d-sm-block">
			<form class="dropdown-menu p-4">
				<div class="mb-3">
					<label for="exampleDropdownFormEmail2" class="form-label">Email address</label>
					<input type="email" class="form-control" id="exampleDropdownFormEmail2" placeholder="email@example.com">
				</div>
				<div class="mb-3">
					<label for="exampleDropdownFormPassword2" class="form-label">Password</label>
					<input type="password" class="form-control" id="exampleDropdownFormPassword2" placeholder="Password">
				</div>
				<div class="mb-3">
					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="dropdownCheck2">
						<label class="form-check-label" for="dropdownCheck2">
						Remember me
						</label>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Sign in</button>
			</form>
		</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
	</body>
</html>