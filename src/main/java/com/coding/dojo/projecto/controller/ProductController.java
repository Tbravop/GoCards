package com.coding.dojo.projecto.controller;

import java.math.BigInteger;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.coding.dojo.projecto.model.BankAccount;
import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.model.ProductCart;
import com.coding.dojo.projecto.model.Sell;
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
	
	List<Sell> sell = new ArrayList<Sell>();
	
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
		return "a??adirCategoria.jsp";
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
    public String update(@Valid @ModelAttribute("product") Product myProduct, BindingResult result, Model model, @RequestParam("desc")double discount )throws Exception{
		Long id = myProduct.getId();
		BigInteger price = myProduct.getPrice();
		int cantidad = myProduct.getCantidad();
        if (result.hasErrors()) {
            return "edit.jsp";
        } 
        try {
        	productService.update(id, price, cantidad);
        	myProduct.setDiscount(discount);
        	myProduct.setDiscountActive(true);
        	myProduct.setDiscountPrice(myProduct.calcularDescuento());
        	productService.createProduct(myProduct);
        }catch(Exception e){
        	model.addAttribute("error", e.getMessage());
            return "edit.jsp";
        }
        return "redirect:/producto/"+id;
    }
	
	@GetMapping("/buscar/{product}")
	public String search(Model model, @PathVariable("product")String name) {
		List<Product> p = productService.searchProduct(name);
		model.addAttribute("list", p);
		model.addAttribute("prod", name);
		return "search.jsp";
	}
	
	@GetMapping("/misProductos")
	public String misProductos(Model model) {		
		User u = userService.getLoggedInUser();
		model.addAttribute("product", u.getProduct());
		return "misProduct.jsp";
	}
	
//	@PostMapping("/addCart")
//	public String addCart(@RequestParam Long id,  @RequestParam Integer cantidad) {
//		List<Product> lp = new ArrayList<Product>();
//		Product p = new Product();
//		Optional<Product> op = Optional.of(productService.findProduct(id));
//		if(op.isPresent()) {
//			
//		}
//	}
	
	@PostMapping("/addCart")
	public String addCart(@RequestParam Long id,  @RequestParam Integer cantidad, HttpSession session, Model model) {
		List<ProductCart> lp = new ArrayList<ProductCart>(); 
		Product p = productService.findProduct(id);
		model.addAttribute("cantidad", cantidad);
		double suma = 0;
		User u = userService.getLoggedInUser();
		System.out.println(u);
//		if(u == null) {
			if(session.getAttribute("carrito") != null) {
				lp = (List<ProductCart>) session.getAttribute("carrito");
			}
			if(session.getAttribute("total_carrito") !=null) {
				suma = (double)session.getAttribute("total_carrito");
			}
			ProductCart pc = new ProductCart();
			pc.setProduct(p);
			pc.setCantidad(cantidad);
			pc.setPrecioTotal(p.getPrice().doubleValue()*cantidad);
			lp.add(pc);
			session.setAttribute("carrito", lp);
			session.setAttribute("total_carrito", suma + pc.getPrecioTotal());
//		}
//		if(u != null) {
//			ProductCart pc = new ProductCart();
//			pc.setCantidad(cantidad);
//			pc.setPrecioTotal(p.getPrice().doubleValue()*cantidad);
//			if(u.getCart()!=null && u.getCart().getProductCart()!=null) {
//				lp = u.getCart().getProductCart();
//				pc.setCart(u.getCart());
//			}
//			pc.setProduct(p);
//			lp.add(pc);
//			model.addAttribute("carrito", lp);
//		}
		
		return "cart.jsp";
	}
}