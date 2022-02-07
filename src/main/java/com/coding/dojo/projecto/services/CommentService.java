package com.coding.dojo.projecto.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.coding.dojo.projecto.model.Comment;

@Service
public interface CommentService {

	List<Comment> allComment();

	Comment create(Comment c);

	Comment findComment(Long id);

	Comment update(Long id, String text) throws Exception;

	void delete(Long id) throws Exception;

}
