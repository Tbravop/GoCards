package com.coding.dojo.projecto.services;

import java.math.BigInteger;
import java.util.List;

import com.coding.dojo.projecto.model.Product;


public interface ProductService {

	List<Product> allProduct();

	Product findProduct(Long id);

	Product update(Long id, BigInteger price, Integer cantidad) throws Exception;

	void delete(Long id) throws Exception;

	Product addC(long idP, long idC);

	List<Product> listaSinCategorias(long id);

	Product createProduct(Product myproduct) throws Exception;

	List<Product> searchProduct(String product);
	
	List<Product> findRandom();
	
	List<Product> newest();
	
	List<Product> productoDesc();
}
