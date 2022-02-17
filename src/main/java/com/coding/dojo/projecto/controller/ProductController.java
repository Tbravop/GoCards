package com.coding.dojo.projecto.controller;

import java.security.Principal;

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
import com.coding.dojo.projecto.model.User;
import com.coding.dojo.projecto.repository.ProductRepository;
import com.coding.dojo.projecto.repository.UserRepository;
import com.coding.dojo.projecto.services.CategoryService;
import com.coding.dojo.projecto.services.ProductService;
import com.coding.dojo.projecto.services.UserService;

@Controller
public class ProductController {

	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	@Lazy
	private ProductService productService;
	@Autowired 
	@Lazy
	private CategoryService categoryService;
	@Autowired
	@Lazy
	private UserService userService;
	
	@GetMapping("/crear")
	public String newProd(@ModelAttribute("product") Product product) {
		return "nuevoProducto.jsp";
	}
	
	@PostMapping("/crear/producto")
	public String createProduct(@Valid @ModelAttribute("product") Product userProduct, BindingResult result,Principal principal, Model model) throws Exception{
		String username = principal.getName();
		model.addAttribute("list", userService.findByEmail(username));
		User u = userService.findByEmail(username);
		if(u.getProduct().contains(userProduct)) {
			return "nuevoProducto.jsp";
		}
		else {
			productService.createProduct(userProduct);
			u.getProduct().add(userProduct);
			userProduct.setUser(u);
			productRepository.save(userProduct);
			userRepository.save(u);
			return "anadirCategoria.jsp";
		}
	}
	
	@PostMapping("/añadirCategorias/{idP}")
	public String addP(@PathVariable("idP") Long id, @RequestParam("idC") Long idC) {
		productService.addC(id, idC);
		return "redirect:/product/"+id;
	}
	
	@GetMapping("/producto/{id}")
	public String mostrarP(@PathVariable("id") Long id, Model model) {
		model.addAttribute("product", productService.findProduct(id));
		return "producto.jsp";
	}
	
	@RequestMapping("/edit/{id}")
    public String editP(@PathVariable("id") Long id, Model model, @Valid @ModelAttribute("product") Product lang) {
		Product product = productService.findProduct(id);
        model.addAttribute("prod", product);
        return "edit.jsp";
    }
	
	@PutMapping("/{name}")
    public String update(@Valid @ModelAttribute("product") Product myProduct, BindingResult result) throws Exception{
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
        	productService.createProduct(myProduct);
            return "redirect:/";
        }
    }
}