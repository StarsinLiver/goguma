package com.store.goguma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.cs.dto.QnaRequestDto;
import com.store.goguma.repository.QnaRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaService {
	
	@Autowired
	private QnaRepository repository;

	public boolean qnaUserWrite(QnaRequestDto dto) {
		int result = repository.qnaUserWrite(dto.toEntity());
		return result != 0;
	}

}
