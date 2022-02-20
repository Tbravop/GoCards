package com.coding.dojo.projecto.controller;

import java.math.BigInteger;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding.dojo.projecto.model.BankAccount;
import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.model.User;
import com.coding.dojo.projecto.services.BankAccountService;
import com.coding.dojo.projecto.services.CategoryService;
import com.coding.dojo.projecto.services.ProductService;
import com.coding.dojo.projecto.services.UserService;

@Controller
public class ProductController {

	@Autowired
	@Lazy
	private ProductService productService;
	@Autowired 
	@Lazy
	private CategoryService categoryService;
	@Autowired
	@Lazy
	private UserService userService;
	@Autowired
	@Lazy
	private BankAccountService accountService;
	
	@GetMapping("/crear")
	public String newProd(@ModelAttribute("product") Product product) {
		return "nuevoProducto.jsp";
	}
	
	@PostMapping("/crear/producto")
	public String createProduct(@Valid @ModelAttribute("product") Product userProduct, BindingResult result,Principal principal, Model model) throws Exception{
		if(result.hasErrors()) {
			return "nuevoProducto.jsp";
		}
		try {
		productService.createProduct(userProduct);
		}
		catch(Exception e){
			model.addAttribute("error", e.getMessage());
			return "nuevoProducto.jsp";
		}
		Long id = userProduct.getId();
		return "redirect:/addCategory/"+id;
	}
	@GetMapping("/addCategory/{id}")
	public String addC(@PathVariable("id") long id, Model model) {
		model.addAttribute("lista", categoryService.listaSinProductos(id));
		model.addAttribute("product", productService.findProduct(id));
		return "añadirCategoria.jsp";
	}
	
	@PostMapping("/anadirCategorias/{idP}")
	public String addP(@PathVariable("idP") Long id, @RequestParam("idC") Long idC) {
		productService.addC(id, idC);
		User u = userService.getLoggedInUser();
		if(u.getProduct().size() == 1) {
			return "redirect:/datosBank";
		}else {
		return "redirect:/producto/"+id;
		}
	}
	
	@GetMapping("/datosBank")
	public String datoB(@ModelAttribute("bank") BankAccount account, HttpSession session, Principal principal) {
		String u = principal.getName();
		User user = userService.findByEmail(u);
		session.setAttribute("idU", user.getId());
		return "datBank.jsp";
	}
	
	@PostMapping("/addDatos")
	public String addD(@Valid @ModelAttribute("bank")BankAccount account, BindingResult result) throws Exception {
	 if (result.hasErrors()) {
            return "datBank.jsp";
        } 
        else {
            accountService.create(account);
            return "redirect:/";
        }
	}
	
	@GetMapping("/producto/{id}")
	public String mostrarP(@PathVariable("id") Long id, Model model, Principal principal) {
		Product p = productService.findProduct(id);
		if(principal == null) {
			model.addAttribute("product", p);
			return "producto.jsp";
		}
		String u = principal.getName();
		User user = userService.findByEmail(u);
		model.addAttribute("currentUser", user);
		model.addAttribute("product", p);
		return "producto.jsp";
	}
	
	@RequestMapping("/edit/{id}")
    public String editP(@PathVariable("id") Long id, Model model, @Valid @ModelAttribute("product") Product prod) {
		Product product = productService.findProduct(id);
        model.addAttribute("prod", product);
        return "edit.jsp";
    }
	
	@PutMapping("/update/{id}")
    public String update(@Valid @ModelAttribute("product") Product myProduct, BindingResult result) throws Exception{
		Long id = myProduct.getId();
		BigInteger price = myProduct.getPrice();
		int cantidad = myProduct.getCantidad();
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
        	productService.update(id, price, cantidad);
            return "redirect:/producto/"+id;
        }
    }
	
	@GetMapping("/buscar/{product}")
	public String search(Model model, @PathVariable("product")String name) {
		List<Product> p = productService.searchProduct(name);
		model.addAttribute("list", p);
		model.addAttribute("prod", name);
		return "search.jsp";
	}
}