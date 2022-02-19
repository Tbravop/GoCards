package com.coding.dojo.projecto.service.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Category;
import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.model.User;
import com.coding.dojo.projecto.repository.ProductRepository;
import com.coding.dojo.projecto.services.CategoryService;
import com.coding.dojo.projecto.services.ProductService;
import com.coding.dojo.projecto.services.UserService;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductRepository productRepository;
	@Autowired
	@Lazy
	private CategoryService categoryService;
	
	@Autowired
	@Lazy
	private UserService userService;

	
	@Override
	public List<Product> allProduct(){
		return (List<Product>) productRepository.findAll();
	}
    
	@Override
    public Product createProduct(Product myProduct) throws Exception {
		//buscar product por name
		User user = userService.getLoggedInUser();
		if(user != null) {
			Optional<Product> product = productRepository.findByNameAndUser(myProduct.getName(), user);
			//si existe error 
			if(product.isPresent()) {
				throw new Exception("El producto ya existe");
			}
			myProduct.setUser(user);
			//si no existe lo crea 
			return productRepository.save(myProduct);
		}
		else {
			throw new Exception("El usuario no esta logeado");
		}
	}
	
	@Override
	@Transactional
	public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepository.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		}
		else {
			return null;
		}
	}
	@Override
	@Transactional
	public Product update(Long id, String name, BigInteger price, String description, Integer cantidad) throws Exception{
		try {
			Product product=this.findProduct(id);
			if(product!=null) {
				product.setName(name);
				product.setPrice(price);
				product.setDescription(description);
				product.setCantidad(cantidad);
				productRepository.save(product);
				return product;
			}
			else {
				throw new Exception();
			}
		}
		catch(Exception e) {
			throw e;
		}
	}
	@Override
	@Transactional
	public void delete(Long id) throws Exception {
		try {
			Product product=this.findProduct(id);
			if(product != null) { 
				productRepository.delete(product);
			}
			else {
				throw new Exception("ya ha sido eliminado");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	@Transactional
	public Product addC (long idP, long idC) {
		Product product = findProduct(idP);
		Category category = categoryService.findCategory(idC);
		product.getCategories().add(category);
		return productRepository.save(product);
	}
	@Override
	public List<Product> listaSinCategorias(long id){
		List<Long> ids = new ArrayList<Long>(); 
		Category c = categoryService.findCategory(id);
		if(!c.getProduct().isEmpty()) {
			for(Product p: c.getProduct()) {
				ids.add(c.getId());
				return (List<Product>) productRepository.findByIdNotIn(ids);
			}
		}
		return allProduct();
	}
	@Override
	public List<Product> searchProduct(String name){
		return (List<Product>) productRepository.findByNameContaining(name);
	}
}
