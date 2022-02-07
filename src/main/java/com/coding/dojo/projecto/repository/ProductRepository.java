package com.coding.dojo.projecto.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

	List<Product> findByIdNotIn(Collection<Long> product);
}
