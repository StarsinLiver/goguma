package com.store.goguma.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private HttpSession httpSession;
	
	// 관리자 유저 수정 페이지
	// localhost://admin/modiUser
	
	@GetMapping("/user")
	public String User(Model model){
		
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		
		model.addAttribute("user",user);
	
		return "admin/admin_user";
	}
	
	
	
	@GetMapping("/userModi")
	public String modifyUser(){
		
	
		
	
		return "admin/admin_user_modi";
	}
	
	@GetMapping("/Emoji")
	public String managementEmoji() {
		
		
		return "";
	}
	
	@GetMapping("/history")
	public String salesHistory() {
		
		
		return "admin/admin_payment_history";
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
