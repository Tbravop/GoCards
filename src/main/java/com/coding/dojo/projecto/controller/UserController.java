package com.coding.dojo.projecto.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding.dojo.projecto.model.Product;
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
            return"redirect:/login";
	}
	
	@GetMapping("/login")
	public String loginPage(){
		return "login.jsp";
	}
	
	@RequestMapping("/login")
    public String login(@RequestParam(value="error", required= false)String error, @RequestParam(value="logout", required=false)String logout, @RequestParam(value = "username")String email, @RequestParam(value="password")String password, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Error o Contraseña Erroneo, Intente de nuevo.");
        }
        if(logout != null) {
            model.addAttribute("logout", "Se cerro Su session de forma Exitosa!");
            return"redirect:/";
        }
            return"redirect:/login";
       
    }
	
	@GetMapping("/")
	public String index(Principal principal, Model model) {
		List<Product> product = productService.allProduct();
		model.addAttribute("producto", product);
		return "index.jsp";
	}
	
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model) {
        // 1
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByEmail(username));
        System.out.println(username);
        return "index.jsp";
    }
    
    @GetMapping("/anadirfavoritos/{id}")
    public String anadirFav (@RequestParam(value = "product", required = false) String productName, @PathVariable("id") Long id, Principal principal) {
    	Product product = productService.findByName(productName);
    	User u = userService.findByEmail(principal.getName());
    	ArrayList<Product> favoritos = u.getFavoritos();
    	if (!favoritos.contains(productName)) {
        	favoritos.add(product);
        	u.setFavoritos(favoritos);
    	}
    return "redirect:/cart";
    }
    
    
}