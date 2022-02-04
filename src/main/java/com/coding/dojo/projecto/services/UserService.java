package com.coding.dojo.projecto.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.User;

@Service
public interface UserService {

	List<User> allUser();
	
	public void createUser(User user);

	User findByEmail(String email);

	User findById(Long id);

}
