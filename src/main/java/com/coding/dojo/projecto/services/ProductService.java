package com.coding.dojo.projecto.services;

import java.math.BigInteger;
import java.util.List;

import com.coding.dojo.projecto.model.Product;


public interface ProductService {

	List<Product> allProduct();

	Product findProduct(Long id);

	Product update(Long id, String name, BigInteger price, String description) throws Exception;

	void delete(Long id) throws Exception;

	Product addC(long idP, long idC);

	List<Product> listaSinCategorias(long id);

	Product createProduct(Product p);


}
