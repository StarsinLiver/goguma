package com.store.goguma.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.repository.ProductHistoryRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductHistoryService {

	private final ProductHistoryRepository historyRepository;
	
	public int countProductHistoryAll() {
		return historyRepository.countProductHistoryAll();
	}
	
	/**
	 * save
	 * @param pId
	 * @param userId
	 * @return
	 */
	@Transactional
	public int save(int pId , int userId) {
		return historyRepository.save(pId, userId);
	}
}
