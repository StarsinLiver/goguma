package com.store.goguma.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminController {

	
	// 관리자 유저 수정 페이지
	// localhost://admin/modiUser
	@GetMapping("/user")
	public String modifyUser(){
		
		
		return "";
	}
	
	@GetMapping("/Emoji")
	public String managementEmoji() {
		
		
		return "";
	}
	
	@GetMapping("/history")
	public String salesHistory() {
		
		
		return "";
	}
	
	@GetMapping("/notice")
	public String managementNotice() {
		
		
		return "";
	}
	
	@GetMapping("/report")
	public String managementReport() {
		
		
		return "";
	}
	
	@GetMapping("/product")
	public String managementProduct() {
		
		
		return "";
	}
	
	@GetMapping("/banner")
	public String managementBanner() {
		
		
		return "";
	}
	
	
	
}
