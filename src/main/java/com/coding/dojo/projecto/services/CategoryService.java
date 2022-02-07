package com.coding.dojo.projecto.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Category;

@Service
public interface CategoryService {

	List<Category> allCateg();

	Category creaate(Category c);

	Category findCategory(Long id);

	Category addP(long idC, long idP);

	List<Category> listaSinProductos(long id);

	
}
