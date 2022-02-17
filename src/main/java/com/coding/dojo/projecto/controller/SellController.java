package com.coding.dojo.projecto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SellController {

	@GetMapping("/carrito")
	public String carrito() {
		return "cart.jsp";
	}
}

// boton corazon para agregar a favoritos

// boton eliminar para sacar un producto del carro

// revisar si se puede cambiar dropdown de cantidad de productos por uno que aumente o disminuya la cantidad con signos + o - (front)


// hacer que el total sume los valores de las cartas a comprar

//ignorar el descuento por ahora

// boton comprar, debe redirigir al envio (a un formulario para la otra pagina)

//boton continuar comprando debe redirigir a marketplace