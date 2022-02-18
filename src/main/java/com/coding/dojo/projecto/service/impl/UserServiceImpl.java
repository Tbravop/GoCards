package com.coding.dojo.projecto.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
	
	@Override
	public User getLoggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(auth.getPrincipal() instanceof org.springframework.security.core.userdetails.User) {
		    org.springframework.security.core.userdetails.User userName = (org.springframework.security.core.userdetails.User)auth.getPrincipal();
		    if(userName!=null) {
			    User user = this.userRepository.findByEmail(userName.getUsername());
			    if(user != null) {
			        return user;
			    }
		    }
		}
	    return null;
	}
	
	@Override
	@Transactional
	public void createUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
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
	
	@Override
	@Transactional
	public User findByName(String name) {
		return userRepository.findByName(name);	
	}
	
	
}
