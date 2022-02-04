package com.coding.dojo.projecto.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

}
