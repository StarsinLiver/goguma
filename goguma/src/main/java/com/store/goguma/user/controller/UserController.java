package com.store.goguma.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	// 유저 페이지
	
	// 내 정보 페이지
	@GetMapping("/info")
	public String infoPage() {
		
		return "/user/info";
	}
	
	// 결제 내역 페이지
	@GetMapping("/payment")
	public String paymentPage() {
		
		return "/user/payment_history";
	}
	// 중고거래 내역 페이지
	@GetMapping("/product")
	public String productPage() {
		
		return "/user/product_history";
	}
	
	// 내 게시글 페이지
	@GetMapping("/board")
	public String boardPage() {
		
		return "/user/board";
	}
	
	// 문의 내역
	@GetMapping("/myQna")
	public String qnaPage() {
		
		return "/user/my_qna";
	}
	
	// 이모티콘(상품) 목록 페이지
	@GetMapping("/imoji")
	public String imojiPage() {
		
		return "/user/my_imoji";
	}
	
	// 찜 목록 페이지
	@GetMapping("/wish")
	public String wishPage() {
		
		return "/user/wish";
	}
}
