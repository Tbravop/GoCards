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
	    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">		
			<link rel="stylesheet" href="/assets/css/style.css">
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet"> 	
			<title>Carrito de compras</title>
	</head>
	<body>
		<nav class="container-fluid navbar navbar-dark" style="height: 80px;background-color: #312783;">
		<div class="justify-content-start">
		    <button class="navbar-toggler m-2" style="border-style: none;color: #312783;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <a class="navbar-brand" href="/">
		      <img src="/assets/img/logo.png" width="120" height="40">
		    </a>    
		 </div>
		<form class="d-flex">
		      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
		</form>
		<div>
		    <button class="fas fa-user fa-2x p-1 text-white" data-bs-toggle="modal" data-bs-target="#exampleModal" style="border-style: none;background-color: #312783;">
			</button>
		    <i class="fas fa-shopping-cart fa-2x p-1 text-white"></i>
		 </div>
		 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		 	<div class="modal-dialog">
		 		<div class="modal-content">
	     			<div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Iniciar sesión</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		 			</div>	
		 		</div>
		 	</div>
		 </div>
	      
		      <div class="modal-body">
		        	<c:if test="${logoutMessage != null}">
        				<c:out value="${logoutMessage}"></c:out>
        			</c:if>
            			<h5>Login</h5>
            		<c:if test="${errorMessage != null}">
                		<c:out value="${errorMessage}"></c:out>
            		</c:if>
           		</div>
           		<div class="d-flex container justify-content-center" style="min-height: 100vh">
			    <div class="row">
			        <aside class="col-lg-9">
			            <div class="card">
			                <div class="table-responsive">
			                    <table class="table table-borderless table-shopping-cart">
			                        <thead class="text-muted">
			                            <tr class="small text-uppercase">
			                                <th scope="col">Productos</th>
			                                <th scope="col" width="120">Cantidad</th>
			                                <th scope="col" width="120">Precio</th>
			                                <th scope="col" class="text-right d-none d-md-block" width="200"></th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <tr>
			                                <td>
			                                    <figure class="itemside align-items-center">
			                                        <div class="aside"><img src="#" class="img-sm"></div>
			                                        <figcaption class="info"> <a href="#" class="title text-dark" data-abc="true"></a>
			                                        </figcaption>
			                                    </figure>
			                                </td>
			                                <td> <select class="form-control">
			                                        <option>1</option>
			                                        <option>2</option>
			                                        <option>3</option>
			                                        <option>4</option>
			                                    </select> </td>
			                                <td>
			                                    <div class="price-wrap"> <var class="price">$1.000</var></div>
			                                </td>
			                                <td class="text-right d-none d-md-block"> <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-secondary" data-toggle="tooltip" data-abc="true"> <i class="fa fa-heart"></i></a> <a href="" class="btn btn-danger" data-abc="true"> Eliminar</a> </td>
			                            </tr>
			                            <tr>
			                                <td>
			                                    <figure class="itemside align-items-center">
			                                        <div class="aside"><img src="#" class="img-sm"></div>
			                                    </figure>
			                                </td>
			                                <td> <select class="form-control">
			                                        <option>1</option>
			                                        <option>2</option>
			                                        <option>3</option>
			                                        <option>4</option>
			                                    </select> </td>
			                                <td>
			                                    <div class="price-wrap"> <var class="price">$1.500</var></div>
			                                </td>
			                                <td class="text-right d-none d-md-block"> <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-secondary" data-toggle="tooltip" data-abc="true"> <i class="fa fa-heart"></i></a> <a href="" class="btn btn-danger btn-round" data-abc="true"> Eliminar</a> </td>
			                            </tr>
			                            <tr>
			                                <td>
			                                    <figure class="itemside align-items-center">
			                                        <div class="aside"><img src="#" class="img-sm"></div>
			                                    </figure>
			                                </td>
			                                <td> <select class="form-control">
			                                        <option>1</option>
			                                        <option>2</option>
			                                        <option>3</option>
			                                    </select> </td>
			                                <td>
			                                    <div class="price-wrap"> <var class="price">$9.000</var></div>
			                                </td>
			                                <td class="text-right d-none d-md-block"> <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-secondary" data-toggle="tooltip" data-abc="true"> <i class="fa fa-heart"></i></a> <a href="" class="btn btn-danger btn-round" data-abc="true"> Eliminar</a> </td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			        </aside>
			        <aside class="col-lg-3">
			            <div class="card">
			                <div class="card-body">
			                    <dl class="dlist-align">
			                        <dt>Total:</dt>
			                        <dd class="text-right ml-3">$11.500</dd>
			                    </dl>
			                    <dl class="dlist-align">
			                        <dt>Discount:</dt>
			                        <dd class="text-right text-danger ml-3">- $0</dd>
			                    </dl>
			                    <dl class="dlist-align">
			                        <dt>Total:</dt>
			                        <dd class="text-right text-dark b ml-3"><strong>$11.500</strong></dd>
			                    </dl>
			                    <hr> <a href="#" class="btn btn-out btn-primary btn-square btn-main" style="background-color: #4B98E0 !important" data-abc="true"> Comprar </a> <a href="#" class="btn btn-out btn-success btn-square btn-main mt-2"style="background-color: #082A5C !important"  data-abc="true">Continuar comprando</a>
			                </div>
			            </div>
			        </aside>
			    </div>
			</div>	
		</body>
	</html>