package com.coding.dojo.projecto.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {
	
	List <Role> findAll();

	List<Role> findByName(String name);
}
