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
	//aside 테스트용
	@GetMapping("/aside")
	public String aside() {
		
		
		return "free_board/free_board_aside";
		
	}
	
	//freeBoard_detail
	@GetMapping("/detail")
	public String Detail() {
		
		
		return "free_board/free_board_detail";
		
	}
	


	
	
}
