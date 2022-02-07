package com.coding.dojo.projecto.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Comuna;
import com.coding.dojo.projecto.repository.ComunaRepository;
import com.coding.dojo.projecto.services.ComunaService;

@Service
public class ComunaServiceImpl implements ComunaService {
	
	@Autowired
	private ComunaRepository comunaRepository;
	
	@Override
	public List<Comuna> allComuna(){
		return (List<Comuna>) comunaRepository.findAll();
	}
}
