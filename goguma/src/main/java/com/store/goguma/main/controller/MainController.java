package com.store.goguma.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.store.goguma.user.dto.OauthResisterDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	@Autowired
	HttpSession httpSession;
	
	@GetMapping("/")
	public String mainForm() {
		
		OauthResisterDTO user = (OauthResisterDTO) httpSession.getAttribute("principal");
		
		log.info("유저 메인~~~~~~~~~~~: "+user);
		
		
		
		
		return "main";
	}
	
	@GetMapping("/login")
	public String loginForm() {
		
		return "login/login";
	}
	
	@GetMapping("/logout")
	public String logoutForm() {
		
		httpSession.invalidate();
		
		return "redirect:/";
	}
	
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
