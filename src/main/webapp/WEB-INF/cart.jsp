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
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
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
  			<!-- Buscador web-->
			<form class="d-flex">
	      		<input class="form-control me-2 d-none d-xl-block" style="width: 700px;" type="search" placeholder="Buscar una carta" aria-label="Search">
      			<button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
	    	</form>
	   		<!-- /// -->
	    	<div class="d-flex">
	    		<p>Inicia Sesión<p>
	    		<button class="fas fa-user fa-2x p-1 text-white" data-bs-toggle="modal" data-bs-target="#exampleModal" style="border-style: none;background-color: #312783;">
				</button>
				<p>Carrito</p>
				<a href="">
	    			<i class="fas fa-shopping-cart fa-2x p-1 text-white"></i>
	    		</a>
	    	</div>
        </nav>
		<!-- TimeLiner -->
		<div class="d-flex container justify-content-center" style="margin: 4vh">
			<ul class='timeline'>
			  <li class='active'>Carro</li>
			  <li>Entrega</li>
			  <li>Pago</li>
			</ul>
		</div>
			<style>
				<!-- CSS timeliner -->
					
				.timeline {
				  margin: 0;
				  padding: 0;
				  list-style: none;
				  max-width: 500px; 
				  margin: 100px auto;  
				  counter-reset: step;
				}
				
				.timeline li {
				  float: left;    
				  text-align: center;
				  width: 150px;   
				  position: relative;  
				}
				
				.timeline li:before {
				  content: counter(step);
				  counter-increment: step;
				  line-height: 35px;
				  width: 35px;
				  height: 35px;
				  display: block;
				  border-radius: 100%;
				  border: 1px solid #CCC;
				  margin: 0 auto 15px auto;  
				  background: #fff;
				}
				
				.timeline li:after {
				  content: '';
				  width: 100%;
				  height: 1px;
				  background: #DDD;
				  display: block;
				  position: absolute;
				  top: 17.5px;
				  left: 50%;
				  z-index: -1;
				}
				
				.timeline li:last-child:after {
				  content: none;
				}
				
				.timeline li.active {
				  color: #838383;
				}
				
				.timeline li:first-child:before {
				  border-color: #838383;  
				}
				.timeline li:first-child:after {
				  background: #838383;  
				}
				ul{
				list-style: none;
				}
			</style>
		
        
        		<!-- carrito -->
           		<div class="d-flex container justify-content-center" style="margin: 10vh">
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