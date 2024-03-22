package com.store.goguma.cs.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.cs.dto.FaqRequestDto;
import com.store.goguma.entity.Faq;
import com.store.goguma.service.FaqService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/cs/api")
@RequiredArgsConstructor
public class FaqController {

	private final FaqService service;

	@GetMapping("/faq/list")
	public ResponseEntity<?> getFaqList() {
		List<Faq> list = service.getFaqList();
		return new ResponseEntity<List<Faq>>(list, HttpStatus.OK);
	}

	@PostMapping("/faq/write")
	public ResponseEntity<?> faqWrite(FaqRequestDto dto) {
		boolean result = service.faqWrite(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
}
