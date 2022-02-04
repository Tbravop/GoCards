package com.coding.dojo.projecto.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.User;
import com.coding.dojo.projecto.repository.RoleRepository;
import com.coding.dojo.projecto.repository.UserRepository;
import com.coding.dojo.projecto.services.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public List<User> allUser(){
		return (List<User>) userRepository.findAll();
	}
	public void createUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRole(roleRepository.findByName("USER_ROLE"));
        userRepository.save(user);
    }
	@Override
	@Transactional
	public User findByEmail(String email) {
	    return userRepository.findByEmail(email);
	}
	@Override
	@Transactional
	public User findById(Long id) {
		Optional<User> u = userRepository.findById(id);
		if(u.isPresent()) {
	        return u.get();
		} else {
		    return null;
		}
	}
}
