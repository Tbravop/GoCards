package com.coding.dojo.projecto.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Comuna;

@Service
public interface ComunaService {

	List<Comuna> allComuna();

}
