package com.coding.dojo.projecto.repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.model.User;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

	List<Product> findByIdNotIn(Collection<Long> product);
	
	Optional<Product> findByName(String name);
	
	Optional<Product> findByNameAndUser(String name, User user);
	
	List<Product>findByNameContaining(String name);
	
	@Query(value = "SELECT * FROM productos ORDER BY RAND() LIMIT 4",  nativeQuery = true)
	List<Product> findRandom();
	
	@Query(value = "SELECT * FROM productos ORDER BY created_at DESC LIMIT 4",  nativeQuery = true)
	List<Product> newest();
	
	@Query(value = "SELECT * FROM go_cards.productos WHERE discount_Active=1 ORDER BY RAND() LIMIT 4", nativeQuery = true)
	List<Product> productosDesc();
}
