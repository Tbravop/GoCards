package com.coding.dojo.projecto.controller;


import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coding.dojo.projecto.model.Article;
import com.coding.dojo.projecto.model.Comment;
import com.coding.dojo.projecto.services.ArticleService;
import com.coding.dojo.projecto.services.CommentService;
import com.coding.dojo.projecto.services.UserService;

@Controller
public class ForoController {
	private final CommentService commentService;
	private final ArticleService articleService;
	private final UserService userService;
	
	public ForoController(CommentService commentService, ArticleService articleService, UserService userService) {
		this.articleService = articleService;
		this.commentService = commentService;
		this.userService = userService;
	}
	
	@RequestMapping("/foro")
	public String dashboard(Model model) {
		model.addAttribute("article", articleService.article());
		return "foro.jsp";
	}
	@GetMapping("/post/new")
	public String addArticle(@ModelAttribute("articulo") Article article) {
		return "article.jsp";
	}
	@PostMapping("/post/new")
	public String addArticle(@Valid @ModelAttribute("articulo") Article article, BindingResult result, RedirectAttributes errors) {
		if(result.hasErrors()) {
			errors.addFlashAttribute("errors" , result.getAllErrors());
			return "article.jsp";
		}
		else {
			articleService.create(article);
			return "redirect:/foro/" + article.getId();
		}
	}
	@GetMapping("/post/{id}")
	public String showArticle(@PathVariable("id")Long artId, @ModelAttribute("articulo") Article article, Model model, @ModelAttribute("comentario")Comment comment) {
		Article art = articleService.findArticle(artId);
		model.addAttribute("article", art);
		model.addAttribute("comment", art.getComment());
		return "article.jsp";
	}
	@GetMapping("/comentario/post")
	public String comentario(@ModelAttribute("comentario") Comment comment) {		
		return "comentario.jsp";		
	}
	@PostMapping("/comentario/post/{id}")
	public String comentario(@PathVariable("id")Long artId, @ModelAttribute("comentario") Comment comment,BindingResult result, RedirectAttributes errors) {
		if(result.hasErrors()) {
			errors.addFlashAttribute("errors", result.getAllErrors());
			return "comentario.jsp";
		}
		else {
			commentService.create(comment);
			return "redirect:/post/" + comment.getId();
		}
	}
}