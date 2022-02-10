package com.coding.dojo.projecto.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Sell;

@Repository
public interface SellRepository extends CrudRepository<Sell, Long>{

}
