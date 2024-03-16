package com.store.goguma.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.store.goguma.entity.Notice;
import com.store.goguma.product.dto.ProductSearchDto;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.NoticeService;
import com.store.goguma.service.ProductHistoryService;
import com.store.goguma.service.ProductService;
import com.store.goguma.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	@Autowired
	HttpSession httpSession;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductHistoryService productHistoryService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ChatRoomService chatRoomService;
	
	@GetMapping("/")
	public String mainForm(Model model) {
		// 공지 사항
		List<Notice> noticeList = noticeService.findLimitEightFromMain();
		// 상품 limit 여덟개 제한
		List<ProductSearchDto> productList = productService.findLimitEightFromMain();
		// 상품 갯수 
		int countProduct = productService.countProductAll();
		// 거래 완료 횟수 
		int countProductHistory = productHistoryService.countProductHistoryAll();
		// 사용자 수 
		int countUser = userService.countUserAll();
		// 채팅방 수
		int countChatRoom = chatRoomService.countChatRoomAll();
		
		log.info("noticeList : {}" , noticeList);
		log.info("productList : {}" , productList);
		model.addAttribute("noticeList" , noticeList);
		model.addAttribute("productList" , productList);
		model.addAttribute("countProduct" , countProduct);
		model.addAttribute("countProductHistory" , countProductHistory);
		model.addAttribute("countUser" , countUser);
		model.addAttribute("countChatRoom" , countChatRoom);
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
}