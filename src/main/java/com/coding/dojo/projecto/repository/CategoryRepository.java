package com.coding.dojo.projecto.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.coding.dojo.projecto.model.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {

	List<Category> findByIdNotIn(Collection<Long> categories);
}
