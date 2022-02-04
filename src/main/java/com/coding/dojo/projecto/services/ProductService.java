package com.coding.dojo.projecto.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Product;

@Service
public interface ProductService {

	List<Product> allProduct();

	Product findProduct(Long id);

	Product create(Product p);

	Product update(Long id, String name, double price, String description) throws Exception;

	void delete(Long id) throws Exception;

}