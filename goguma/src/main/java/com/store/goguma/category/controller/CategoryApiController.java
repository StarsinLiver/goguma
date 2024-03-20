package com.store.goguma.category.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.category.dto.CategoryRequestDto;
import com.store.goguma.category.dto.CategoryResponseDto;
import com.store.goguma.service.CategoryService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/board/api")
@RequiredArgsConstructor
public class CategoryApiController {
	
	private final CategoryService service;
	
	@PostMapping("/category/add")
	public ResponseEntity<?> addCate(@RequestPart(value = "cateList") List<CategoryRequestDto> cateList){
		//boolean result = service.addCate(cateList);
		for(int i = 0; i < cateList.size(); i++) {
			System.out.println(cateList.get(i));
		}
		boolean result = true;
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public ResponseEntity<?> getList(){
		List<CategoryResponseDto> list = service.getList();
		return new ResponseEntity<List<CategoryResponseDto>>(list, HttpStatus.OK);
	}
	
}
