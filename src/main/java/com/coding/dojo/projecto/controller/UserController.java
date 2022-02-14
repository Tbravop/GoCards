package com.coding.dojo.projecto.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
            return"redirect:/registration";
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
	
}