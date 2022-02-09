package com.coding.dojo.projecto.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Product;

@Service
public interface ProductService {

	List<Product> allProduct();

	Product findProduct(Long id);

	Product update(Long id, String name, double price, String description) throws Exception;

	void delete(Long id) throws Exception;

	Product addC(long idP, long idC);

	List<Product> listaSinCategorias(long id);

	Product create(Product p, Long id) throws Exception;


}
