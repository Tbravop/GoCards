package com.coding.dojo.projecto.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.repository.ProductRepository;
import com.coding.dojo.projecto.services.ProductService;



@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	public List<Product> allProduct(){
		return (List<Product>) productRepository.findAll();
	}
	@Override
	@Transactional
    public Product create(Product p) {
        return productRepository.save(p);
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
	public Product update(Long id, String name, double price, String description) throws Exception{
		try {
			Product product=this.findProduct(id);
			if(product!=null) {
				product.setName(name);
				product.setPrice(price);
				product.setDescription(description);
				productRepository.save(product);
				return product;
			}
			else {
				throw new Exception("salavado con exito");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
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
}
