package com.store.goguma.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.store.goguma.entity.BoardCategorySub;
import com.store.goguma.repository.BoardSubCategoryRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class BoardService {

	private final BoardSubCategoryRepository boardSubCategoryRepository;
	
	// 해당 메인 카테고리에 맞는 서브 카테고리 찾기
	public List<BoardCategorySub> findByGroupId(int groupId) {
		return boardSubCategoryRepository.findByGroupId(groupId);
	}
}
