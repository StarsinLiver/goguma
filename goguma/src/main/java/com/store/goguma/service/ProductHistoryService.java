package com.store.goguma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.repository.ProductHistoryRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductHistoryService {

	@Autowired
	ProductHistoryRepository historyRepository;
	
	public int countProductHistoryAll() {
		return historyRepository.countProductHistoryAll();
	}
}
