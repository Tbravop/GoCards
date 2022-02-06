package com.coding.dojo.projecto.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Article;

@Service
public interface ArticleService {

	List<Article> article();

	Article create(Article a);

	Article findArticle(Long id);

	Article update(Long id, String title, String body) throws Exception;

	void delete(Long id) throws Exception;

}
