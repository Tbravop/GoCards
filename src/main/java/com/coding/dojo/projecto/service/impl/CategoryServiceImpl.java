package com.coding.dojo.projecto.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Category;
import com.coding.dojo.projecto.model.Product;
import com.coding.dojo.projecto.repository.CategoryRepository;
import com.coding.dojo.projecto.services.CategoryService;
import com.coding.dojo.projecto.services.ProductService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	@Lazy
	private ProductService productService;
	
	@Override
	public List<Category> allCateg() {
		return (List<Category>)  categoryRepository.findAll();
	}
	@Override
	@Transactional
	public Category creaate(Category c) {
		return categoryRepository.save(c);
	}
	@Override
	@Transactional
	public Category findCategory(Long id) {
		Optional<Category> optionalCateg = categoryRepository.findById(id);
		if(optionalCateg.isPresent()) {
			return optionalCateg.get();
		}
		else {
			return null;			
		}
	}
	@Override
	@Transactional
	public Category addP (long idC, long idP) {
		Category category = findCategory(idC);
		Product product = productService.findProduct(idP);
		category.getProduct().add(product);
		return categoryRepository.save(category);
	}
	@Override
	public List<Category> listaSinProductos(long id){
		List<Long> ids = new ArrayList<Long>(); 
		Product p = productService.findProduct(id);
		if(!p.getCategories().isEmpty()) {
			for(Category c: p.getCategories()) {
			ids.add(c.getId());
			return (List<Category>) categoryRepository.findByIdNotIn(ids);
		}
	}
	return allCateg();
}
}
