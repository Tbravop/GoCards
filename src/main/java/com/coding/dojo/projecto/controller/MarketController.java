package com.coding.dojo.projecto.controller;

import java.security.Principal;
import java.util.List;

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

import com.coding.dojo.projecto.model.Category;
import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.model.User;
import com.coding.dojo.projecto.services.CategoryService;
import com.coding.dojo.projecto.services.ProductService;
import com.coding.dojo.projecto.services.RoleService;
import com.coding.dojo.projecto.services.UserService;
import com.coding.dojo.projecto.validator.UserValidator;

@Controller
public class MarketController {

	@Autowired
	@Lazy
	private UserService userService;
	@Autowired 
	@Lazy
	private UserValidator userValidator;
	@Autowired 
	@Lazy
	private RoleService roleService;
	@Autowired
	@Lazy
	private ProductService productService;
	@Autowired 
	@Lazy
	private CategoryService categoryService;
	
	@GetMapping("/registration")
    public String register(@Valid @ModelAttribute("user")User user, Model model) {
        model.addAttribute("rol", roleService.allRole());
        return"loginRegister.jsp";
    }
	@PostMapping("/registration")
    public String registerUser(@Valid @ModelAttribute("user")User user, BindingResult result) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return"loginRegister.jsp";
        }
        else {
            userService.createUser(user);
            return"redirect:/registration";
        }
	}
	@RequestMapping("/login")
    public String login(@RequestParam(value="error", required= false)String error, @RequestParam(value="logout", required=false)String logout,Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Error o Contraseña Erroneo, Intente de nuevo.");
        }
        if(logout != null) {
            model.addAttribute("logout", "Se cerro Su session de forma Exitosa!");
            return"redirect:/registration";
        }
        else {
            return"redirect:/";
        }
        
    }
	
	@GetMapping("/")
	public String index(Principal principal, Model model) {
		List<Product> product = productService.allProduct();
		model.addAttribute("producto", product);
		return "index.jsp";
	}
	@GetMapping("/crear")
	public String newProd(@ModelAttribute("product") Product product) {
		return "nuevoProducto.jsp";
	}
	@PostMapping("/crear/producto")
	public String createP(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if(result.hasErrors()) {
			return "nuevoProducto.jsp";
		}
		else {
			productService.create(product);
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
    public String update(@Valid @ModelAttribute("lang") Product product, BindingResult result) throws Exception {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
        	productService.create(product);
            return "redirect:/";
        }
    }
}