package com.store.goguma.main.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.goguma.entity.Banner;
import com.store.goguma.entity.Notice;
import com.store.goguma.main.dto.BannerDTO;
import com.store.goguma.product.dto.ProductSearchDto;
import com.store.goguma.service.BannerService;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.NoticeService;
import com.store.goguma.service.ProductHistoryService;
import com.store.goguma.service.ProductService;
import com.store.goguma.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

	private final HttpSession httpSession;

	private final NoticeService noticeService;

	private final ProductService productService;

	private final ProductHistoryService productHistoryService;

	private final UserService userService;

	private final ChatRoomService chatRoomService;

	private final BannerService bannerService;
	
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

		log.info("noticeList : {}", noticeList);
		log.info("productList : {}", productList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("productList", productList);
		model.addAttribute("countProduct", countProduct);
		model.addAttribute("countProductHistory", countProductHistory);
		model.addAttribute("countUser", countUser);
		model.addAttribute("countChatRoom", countChatRoom);
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
	
	
	// 배너 전용 컨트롤러
	@GetMapping("/banner")
	@ResponseBody
	public List<Banner> bannerProc(@RequestParam("type") String type) {
		
		log.info("컨트롤러 타고들어오는 배너 타입 확인 : "+type);
		
		
		List<Banner> result = bannerService.findByAll(type);
		
		log.info("배너 컨트롤러 로그: "+result);
		
		return result;
	}
	
}