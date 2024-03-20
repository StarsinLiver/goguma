package com.store.goguma.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.category.dto.CategoryRequestDto;
import com.store.goguma.category.dto.CategoryResponseDto;
import com.store.goguma.category.dto.CategoryResponseDto.subResponseDto;
import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;
import com.store.goguma.repository.CategoryRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CategoryService {

	private final CategoryRepository repository;

	@Transactional
	public boolean addCate(List<CategoryRequestDto> cateList) {
		int mainResult = 0;
		int mainDelete = repository.mainDelete();
		int subDelete = repository.subDelete();
		System.out.println("삭제1 : "+mainDelete);
		System.out.println("삭제2 : "+subDelete);
		for(int i = 0; i < cateList.size(); i++) {
			mainResult += repository.cate1Save(cateList.get(i).toEntity());
			int subResult = 0;
			for(int k = 0; k < cateList.get(i).getSubList().size(); k++) {
				subResult += repository.cate2Save(cateList.get(i).getSubList().get(k).toEntity());
			}
			if(subResult != cateList.get(i).getSubList().size()) {
				throw new RuntimeException("cate2 등록 실패");
			}
		}
		if(mainResult != cateList.size()) {
			throw new RuntimeException("cate1 등록 실패");
		}else {
			return true;
		}
	}

	public List<CategoryResponseDto> getList() {
		List<BoardCategoryMain> mainList = repository.getMainList();
		List<BoardCategorySub> subList = repository.getSubList();
		List<CategoryResponseDto> mainResp = new ArrayList<>();
		
		for(int i = 0; i < mainList.size(); i++) {
			CategoryResponseDto mainDto = new CategoryResponseDto();
			mainDto.setIndex(mainList.get(i).getId());
			mainDto.setName(mainList.get(i).getName());
			mainResp.add(mainDto);
		}
		
		for(int i = 0; i < mainList.size(); i++) {
			List<subResponseDto> subResp = new ArrayList<>();
			for(int k = 0; k < subList.size(); k++) {
				if(mainList.get(i).getMainIndex() == subList.get(k).getGroupId()) {
					subResponseDto subDto = new subResponseDto();
					subDto.setMainIndex(subList.get(k).getGroupId());
					subDto.setIndex(subList.get(k).getId());
					subDto.setName(subList.get(k).getName());
					subResp.add(subDto);
					mainResp.get(i).setSubList(subResp);
				}
			}// for(int k
		}
		return mainResp;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
