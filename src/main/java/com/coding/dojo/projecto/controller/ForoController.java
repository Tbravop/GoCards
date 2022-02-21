package com.coding.dojo.projecto.controller;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		System.out.println(articleService.article());
		return "foro.jsp";
	}
	@GetMapping("/post/new")
	public String addArticle(@ModelAttribute("articulo") Article article) {
		return "article.jsp";
	}
	@PostMapping("/post/new")
	public String addArticle(@Valid @ModelAttribute("articulo") Article article, BindingResult result, RedirectAttributes errors, @RequestParam("file")MultipartFile imagen) {
		if(result.hasErrors()) {
			errors.addFlashAttribute("errors" , result.getAllErrors());
			return "article.jsp";
		}
		if(!imagen.isEmpty()) {
			Path directorioImagenes = Paths.get("src//main//resources//static//assets/img");
			String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath();
			try {
				byte[] bytesImg = imagen.getBytes();
				Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + imagen.getOriginalFilename());
				Files.write(rutaCompleta, bytesImg);
				article.setImagen(imagen.getOriginalFilename());
			} catch (IOException e) {
				e.printStackTrace();
			}			
		}			
			articleService.create(article);
			return "redirect:/foro/";		
				
	}
	@GetMapping("/post/{id}")
	public String showArticle(@PathVariable("id")Long artId, @ModelAttribute("article") Article article, Model model, @ModelAttribute("comentario")Comment comment) {
		Article art = articleService.findArticle(artId);
		model.addAttribute("article", art);
		model.addAttribute("comment", art.getComment());
		return "showPost.jsp";		
	}
	@RequestMapping("/post/{id}/editar")
	public String editar(@PathVariable("id")Long artId, Model model) {
		Article art = articleService.findArticle(artId);
		model.addAttribute("article", art);
		return "editarPost.jsp";
	}
	@RequestMapping(value="/post/{id}/editar", method=RequestMethod.PUT)
	public String actualizar(@Valid @ModelAttribute("article")Article article, BindingResult result,@PathVariable("id")Long artId,@RequestParam("file")MultipartFile imagen) {
		Article viejo = articleService.findArticle(artId);
		if(result.hasErrors()) {
			return "editarPost.jsp";
		}
		if(!imagen.isEmpty()) {
			Path directorioImagenes = Paths.get("src//main//resources//static//assets/img");
			String rutaAbsoluta = directorioImagenes.toFile().getAbsolutePath();
			try {
				byte[] bytesImg = imagen.getBytes();
				Path rutaCompleta = Paths.get(rutaAbsoluta + "//" + imagen.getOriginalFilename());
				Files.write(rutaCompleta, bytesImg);
				article.setImagen(imagen.getOriginalFilename());
			} catch (IOException e) {
				e.printStackTrace();
			}			
		}
		if(imagen.isEmpty()) {
			article.setImagen(viejo.getImagen());
		}
			articleService.create(article);
			return "redirect:/post/{id}";
		
	}
	@GetMapping("/post/{id}/comentar")
	public String comentario(@ModelAttribute("comentario") Comment comment) {		
		return "comentario.jsp";		
	}
	@PostMapping("/post/{id}/comentar")
	public String comentario(@PathVariable("id")Long artId, @ModelAttribute("comentario") Comment comment, BindingResult result, RedirectAttributes errors, Model model) {
		Article art = articleService.findArticle(artId);
		if(result.hasErrors()) {
			errors.addFlashAttribute("errors", result.getAllErrors());
			return "comentario.jsp";
		}
		else {
			commentService.create(comment);
			List<Comment> comentarios =  art.getComment();
			if(comentarios.contains(comment)){
				return "comentario.jsp";
			}
			else {
				comentarios.add(comment);
				art.setComment(comentarios);
				return "redirect:post/{id}";
			}			
		}
	}
}