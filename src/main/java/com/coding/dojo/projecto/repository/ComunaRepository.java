package com.coding.dojo.projecto.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Comuna;

@Repository
public interface ComunaRepository extends CrudRepository<Comuna, Long>{

	
}
