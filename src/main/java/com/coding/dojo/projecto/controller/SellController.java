package com.coding.dojo.projecto.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SellController {

	@PostMapping("/carrito")
	public String carrito() {
		return "cart.jsp";
	}
	
	@GetMapping("/envio")
	public String envio() {
		return "envio.jsp";
	}
	
	@GetMapping("/pagar")
	public String pagar() {
		return "pagar.jsp";
	}
}