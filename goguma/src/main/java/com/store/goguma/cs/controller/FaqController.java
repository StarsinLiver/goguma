package com.store.goguma.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.entity.Faq;
import com.store.goguma.service.FaqService;

@RestController
@RequestMapping("/cs/api")
public class FaqController {

	@Autowired
	private FaqService service;
	
	@GetMapping("/faq/list")
	public ResponseEntity<?> getFaqList(){
		List<Faq> list = service.getFaqList();
		return new ResponseEntity<List<Faq>>(list, HttpStatus.OK);
	}
}
