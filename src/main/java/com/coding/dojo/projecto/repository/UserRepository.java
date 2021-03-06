package com.coding.dojo.projecto.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{

	User findByEmail(String email);
	
	User findByName(String name);
	
}
