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
		 <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #312783;">
        <div class="container-fluid col-12">
         <a href="/">
	      	<img src="/assets/img/logo.png" width="120" height="40">
	      	</a>  
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse pt-1" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item px-5 d-none d-lg-block">
		 		<form class="d-flex">
			        <input class="form-control me-2" style="width: 500px;" type="search" placeholder="Buscar una carta" aria-label="Search">
			        <button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
		      	</form>	      	
              </li>
              <li class="nav-item">
		 		<form class="d-flex d-lg-none pt-2">
			        <input class="form-control me-2" style="width: 300px;" type="search" placeholder="Buscar una carta" aria-label="Search">
			        <button class="btn btn-outline-info" type="submit"><i class="fas fa-search"></i></button>
		      	</form>	      	
              </li>              
              <li class="nav-item">
                <a class="nav-link" href="/foro">Ir a Comunidad</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  MarketPlace
                </a>
                <ul class="dropdown-menu" style="background-color: white;" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="#">Lo más Vendido</a></li>
                  <li><a class="dropdown-item" href="#">Ofertas Destacadas</a></li>
                  <li><a class="dropdown-item" href="#">Lo nuevo</a></li>                  
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="#">Bases</a></li>
                  <li><a class="dropdown-item" href="#">Productos Sellados</a></li>
                  <li><a class="dropdown-item" href="#">Lotes</a></li>     
                  <li><a class="dropdown-item" href="#">Vender</a></li>                                                                                     
                </ul>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="/producto">Vender</a>
              </li>        
            </ul>
			<a href="#" class="d-flex" data-bs-toggle="modal" data-bs-target="#exampleModal" style="text-decoration: none;">
      		<i class="fas fa-user fa-2x p-1 text-white"></i>
				<p class="text-white">Inicia sesión</p>
		    </a>  
			<a href="/carrito" class="d-flex" style="text-decoration: none;">
      		<i class="fas fa-shopping-cart fa-2x p-1 text-white"></i>
      		<p class="text-white">Carrito</p>
      		</a>            
          </div>
         </div>
      </nav>
      <!-- Modal login-->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Iniciar sesión</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
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
		<!-- TimeLiner -->
		<div class="d-flex container justify-content-center" style="margin: 11vh">
			<div class="container" margin-left 20px>
			    <div class="platform-tour-wrapper py-3">
			      <!-- Nav tabs -->
				      <ul class="nav nav-tabs justify-content-around border-0 horizontal-tabs-steps">
				        <li class="nav-item">
				          <a class="nav-link active" data-toggle="tab"><span>1</span>
				          </a>
				          <h4 class="text-center mt-1">Carro</h4>
				        </li>
				
				        <li class="nav-item">
				          <a class="nav-link" data-toggle="tab" ><span>2</span></a>
				          <h4 class="text-center mt-1">Envio</h4>
				        </li>
				
				        <li class="nav-item">
				          <a class="nav-link" data-toggle="tab" ><span>3</span></a>
				          <h4 class="text-center mt-1">Pago</h4>
				        </li>
			       	</ul>
			        
				</div>
			</div>
		</div>
		<style>
			<!-- CSS timeliner -->
				.horizontal-tabs-steps {
				  position: relative;
				}
				
				.horizontal-tabs-steps .nav-item {
				  z-index: 1;
				  position: relative;
				}
				
				.horizontal-tabs-steps .nav-item:after {
				  content: "";
				  border-top: 12px dotted #C4C4C4;
				  position: absolute;
				  z-index: 0;
				  top: 10px;
				  width: 390px;
				  left: 0px;
				  transition: border 1s ease-out;
				  transition-delay: 0s, 0s, 0.1s;
				}
				
				.horizontal-tabs-steps .nav-item:last-child:after {
				  content: "";
				  border-top: 0px dotted #C4C4C4;
				}
				
				.horizontal-tabs-steps .nav-item.complete-step:after {
				  content: "";
				  border-top: 5px dotted #C4C4C4;
				  position: absolute;
				  z-index: 0;
				  top: 12px;
				  width: 265px;
				  left: 0px;
				  transition: border 1s ease-out;
				  transition-delay: 0s, 0s, 0.1s
				}
				
				.horizontal-tabs-steps .nav-link {
				  background: #fff;
				  border-radius: 50%;
				  width: 50px;
				  height: 50px;
				  color: #131313;
				  padding: 0;
				  display: flex;
				  justify-content: center;
				  align-items: center;
				  font-size: 12px;
				  border: 2px solid #082A5C;
				  z-index: 1;
				  position: relative;
				}
				
				
				
				.horizontal-tabs-steps .nav-link:hover .horizontal-tabs-steps .nav-link span {
				  color: #4B98E0  !important;
				}
				
				.horizontal-tabs-steps .nav-item h4 {
				  font-size: 20px;
				  color:#838383;
				}
				/*********** Responsive CSS Start***************/
				
				@media only screen and (max-width: 575px) {
				  .vertical-tabs-steps .nav-link {
				    width: 73px;
				  }  
				
				  .vertical-tabs-steps .nav-link.checked-steps {
				    padding: 10px 7px;
				  }  
				
				  .vertical-tabs-steps .checked-steps:after {
				    content: "\f00c";
				    font-family: FontAwesome;
				    color: #fff;
				    position: absolute;
				    right: 7px;
				  }  
				}

				@media only screen and (min-width: 992px) and (max-width: 1199px) {
				  .horizontal-tabs-steps .nav-item:after {
				    content: "";
				    width: 219px;
				  } 
				}
				
				@media only screen and (min-width: 768px) and (max-width: 991px) {
				  .horizontal-tabs-steps .nav-item:after {
				    content: "";
				    width: 160px;
				  } 
				}
				
				@media only screen and (min-width: 421px) and (max-width: 767px) {
				  .horizontal-tabs-steps .nav-item:after {
				    content: "";
				    width: 115px;
				  } 
				}
				
				@media only screen and (max-width: 420px) {
				  .horizontal-tabs-steps .nav-item:after {
				    content: "";
				    width: 95px;
				  } 
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