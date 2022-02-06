package com.coding.dojo.projecto.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Article;
import com.coding.dojo.projecto.repository.ArticleRepository;
import com.coding.dojo.projecto.services.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleRepository articleRepository;
	
	@Override
	public List<Article> article(){
		return (List<Article>) articleRepository.findAll();
	}
	@Override
	@Transactional
    public Article create(Article a) {
        return articleRepository.save(a);
    }
	@Override
	@Transactional
	public Article findArticle(Long id) {
		Optional<Article> optionalArticle = articleRepository.findById(id);
		if(optionalArticle.isPresent()) {
			return optionalArticle.get();
		}
		else {
			return null;
		}
	}
	@Override
	@Transactional
	public Article update(Long id, String title, String body) throws Exception{
		try {
			Article article=this.findArticle(id);
			if(article!=null) {
				article.setBody(title);
				article.setBody(body);
				articleRepository.save(article);
				return article;
			}
			else {
				throw new Exception("salavado con exito");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public void delete(Long id) throws Exception {
		try {
			Article article=this.findArticle(id);
			if(article != null) {
				articleRepository.delete(article);
			}
			else {
				throw new Exception("ya ha sido eliminado");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
