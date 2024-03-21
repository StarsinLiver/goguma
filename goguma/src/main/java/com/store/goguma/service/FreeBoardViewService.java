package com.store.goguma.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.freeboard.dto.FreeBoardViewDTO;
import com.store.goguma.repository.FreeBoardViewRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreeBoardViewService {
	private final FreeBoardViewRepository boardViewRepository;
	
	@Transactional
	public int save(int boardId) {
		return boardViewRepository.save(boardId);
	}
	
	@Transactional
    public int plusFreeView(int freeBoardId) {
    	int result = boardViewRepository.plusFreeView(freeBoardId);
    	return result;
    }

    public FreeBoardViewDTO getFreeView(int id) {
        return boardViewRepository.getFreeView(id);
    }
	
}
