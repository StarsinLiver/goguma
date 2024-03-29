package com.store.goguma.cs.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.cs.dto.QnaRequestDto;
import com.store.goguma.service.QnaService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/cs/api")
@RequiredArgsConstructor
public class QnaController {

	private final QnaService service;

	@PostMapping("/qna/write")
	public ResponseEntity<?> qnaUserWrite(QnaRequestDto dto) {
		boolean result = service.qnaUserWrite(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
}
