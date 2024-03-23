package com.store.goguma.category.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
	public ResponseEntity<?> addCategory(@RequestPart(value = "mainCateList") List<CategoryRequestDto> dtos,
			@RequestPart(value = "file", required = false) MultipartFile file){
		boolean result = service.addCategory(dtos, file);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public ResponseEntity<?> getList(){
		List<CategoryResponseDto> list = service.getList();
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		return new ResponseEntity<List<CategoryResponseDto>>(list, HttpStatus.OK);
	}
	
	@DeleteMapping("/remove")
	public ResponseEntity<?> categoryRemove(int id, String checkTitle){
		boolean result = service.categoryRemove(id, checkTitle);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
}
