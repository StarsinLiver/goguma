package com.store.goguma.freeboard.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.freeboard.dto.FreeBoardPageDTO;
import com.store.goguma.service.FreeBoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeboardRestController {

	private final FreeBoardService freeBoardService;
	
	
	@GetMapping("/list")
	public List<?> BoardList(FreeBoardPageDTO page, Model model){
		
		
		
		
		
		return null;
	}  
	
	
}
