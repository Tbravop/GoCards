package com.coding.dojo.projecto.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Role;
import com.coding.dojo.projecto.repository.RoleRepository;
import com.coding.dojo.projecto.services.RoleService;

@Service
public class RoleServiceImpl implements RoleService{


	@Autowired 
	private RoleRepository roleRepository;
	
	@Override
	public List<Role> allRole(){
		return (List<Role>) roleRepository.findAll();
	}
}
