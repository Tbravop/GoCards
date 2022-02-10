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
