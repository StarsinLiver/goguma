package com.store.goguma.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	
	@GetMapping("/")
	public String mainForm() {
		
		return "main";
	}
	
//	@GetMapping("/login")
//	public String loginForm() {
//		
//		return "login/login";
//	}
//	
//	@GetMapping("/product")
//	public String productForm() {
//		return "product/detail";
//	}
//	
//	@GetMapping("/free-board")
//	public String freeBoard() {
//		return "free_board/main";
//	}
}
