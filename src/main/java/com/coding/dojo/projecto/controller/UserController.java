package com.coding.dojo.projecto.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.model.ProductCart;
import com.coding.dojo.projecto.model.User;
import com.coding.dojo.projecto.services.ProductService;
import com.coding.dojo.projecto.services.RoleService;
import com.coding.dojo.projecto.services.UserService;
import com.coding.dojo.projecto.validator.UserValidator;

@Controller
public class UserController {

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
	
	
	@RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user")User user) {
        return"loginRegister.jsp";
    }
	
	@PostMapping("/registration")
    public String register(@Valid @ModelAttribute("user")User user, BindingResult result,Model model, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return"loginRegister.jsp";
        }
        	userService.createUser(user);
            return"redirect:/goLogin";
	}
	
	@GetMapping("/goLogin")
	public String loginPage(){
		return "login.jsp";
	}
	
	@GetMapping("/login")
    public String login(@RequestParam(value="error", required= false)String error, @RequestParam(value="logout", required=false)String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Error o Contrase??a Erroneo, Intente de nuevo.");
    		return "login.jsp";
        }
        if(logout != null) {
            model.addAttribute("logout", "Se cerro Su session de forma Exitosa!");
            return"redirect:/";
        }
            return"redirect:/";
    }
	
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model, HttpSession session) {
    	List<Product> random = productService.findRandom();
    	List<Product> newest = productService.newest();
    	List<Product> productoDesc = productService.productoDesc();
    	model.addAttribute("products", random);
    	model.addAttribute("newest", newest);
    	model.addAttribute("productoDesc", productoDesc);
    	if(principal != null) {
	        String username = principal.getName();
	        model.addAttribute("currentUser", userService.findByEmail(username));
	        System.out.println(username);
    	}else {
    		if(session.getAttribute("carrito") == null) {
    		List<ProductCart> lp = new ArrayList<ProductCart>();
    		session.setAttribute("carrito", lp);
    		}
    	}
        return "index.jsp";
    }
    
    @DeleteMapping("/eliminarproducto/{id}")
    public String deleteProdCart (@PathVariable("id") Long id) throws Exception {
    	productService.delete(id);
    	return "redirect:/cart";
    }
}
