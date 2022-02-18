package com.coding.dojo.projecto.repository;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.model.User;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

	List<Product> findByIdNotIn(Collection<Long> product);
	
	Optional<Product> findByName(String name);
	
	Optional<Product> findByNameAndUser(String name, User user);
}
