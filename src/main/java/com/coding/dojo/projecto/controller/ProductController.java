package com.coding.dojo.projecto.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.services.CategoryService;
import com.coding.dojo.projecto.services.ProductService;

@Controller
public class ProductController {

	@Autowired
	@Lazy
	private ProductService productService;
	@Autowired 
	@Lazy
	private CategoryService categoryService;
	
	@GetMapping("/crear")
	public String newProd(@ModelAttribute("product") Product product) {
		return "nuevoProducto.jsp";
	}
	
	@PostMapping("/crear/producto")
	public String createP(@Valid @ModelAttribute("product") Product product, BindingResult result) throws Exception {
		if(result.hasErrors()) {
			return "nuevoProducto.jsp";
		}
		else {
			productService.create(product, null);
			return "anadirCategoria.jsp";
		}
	}
	@PostMapping("/añadirCategorias/{idP}")
	public String addP(@PathVariable("idP") long id, @RequestParam("idC") long idC) {
		productService.addC(id, idC);
		return "redirect:/product/"+id;
	}
	@GetMapping("/producto/{id}")
	public String mostrarP(@PathVariable("id") long id, Model model) {
		model.addAttribute("product", productService.findProduct(id));
		return "producto.jsp";
	}
	@RequestMapping("/edit/{id}")
    public String editP(@PathVariable("id") Long id, Model model, @Valid @ModelAttribute("product") Product lang) {
		Product product = productService.findProduct(id);
        model.addAttribute("prod", product);
        return "edit.jsp";
    }
	@PutMapping("/{id}")
    public String update(@Valid @ModelAttribute("lang") Product product, BindingResult result, @PathVariable("id") Long id) throws Exception {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
        	productService.create(product, id);
            return "redirect:/";
        }
    }
}