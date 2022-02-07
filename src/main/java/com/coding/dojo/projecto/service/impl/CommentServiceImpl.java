package com.coding.dojo.projecto.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Comment;
import com.coding.dojo.projecto.repository.CommentRepository;
import com.coding.dojo.projecto.services.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentRepository commentRepository;
	
	@Override
	public List<Comment> allComment() {
		return (List<Comment>) commentRepository.findAll();
	}
	@Override
	@Transactional
	public Comment create(Comment c) {
		return commentRepository.save(c);
	}
	@Override
	@Transactional
	public Comment findComment(Long id) {
		Optional<Comment> optionalComment = commentRepository.findById(id);
		if(optionalComment.isPresent()) {
			return optionalComment.get();
		}
		else {
			return null;
		}
	}
	@Override
	@Transactional
	public Comment update(Long id, String text) throws Exception{
		try {
			Comment comment=this.findComment(id);
			if(comment!=null) {
				comment.setText(text);
				commentRepository.save(comment);
				return comment;
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
	@Transactional
	public void delete(Long id) throws Exception {
		try {
			Comment comment=this.findComment(id);
			if(comment != null) {
				commentRepository.delete(comment);
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
