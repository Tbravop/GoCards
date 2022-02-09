package com.coding.dojo.projecto.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class SellController {

	@GetMapping("/carrito")
	public String carrito() {
		return "cart.jsp";
	}
}