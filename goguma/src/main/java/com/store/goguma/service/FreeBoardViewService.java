package com.store.goguma.service;

import org.springframework.stereotype.Service;

import com.store.goguma.repository.FreeBoardViewRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreeBoardViewService {
	private final FreeBoardViewRepository boardViewRepository;
	
	
	public int save(int boardId) {
		return boardViewRepository.save(boardId);
	}
	
}
