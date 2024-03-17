package com.store.goguma.freeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FreeboardController {

	
	
	
	
	@GetMapping("/free_board")
	public String aside() {
		
		
		return "free_board/free_board_aside";
		
	}
	
	@GetMapping("/free_board/main")
	public String main() {
		
		
		return "free_board/main";
		
	}
}
