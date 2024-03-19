package com.store.goguma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.repository.FreeBoardRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FreeBoardService {
	
	
	@Autowired
	private FreeBoardRepository repository;
	
	
	public void selectArticleType(int cate1, int cate2) {

		
	}

	public void selectArticleAllBycate(int cate1, int cate2) {
		// TODO Auto-generated method stub
		
	}

	
	
	
}
