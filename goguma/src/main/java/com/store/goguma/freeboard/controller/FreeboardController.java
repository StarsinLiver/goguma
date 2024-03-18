package com.store.goguma.freeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/freeBoard")
public class FreeboardController {

	@GetMapping("/main")
	public String boardMain() {
		
		return "/free_board/free-main";
	}
	
	@GetMapping("/list")
	public String boardList() {
		
		return "/free_board/free-list";
	}
	
	@GetMapping("/card")
	public String boardCard() {
		
		return "/free_board/free-card";
	}
	
	@GetMapping("/write")
	public String boardWrite() {
		
		return "/free_board/free-write";
	}
	
}
