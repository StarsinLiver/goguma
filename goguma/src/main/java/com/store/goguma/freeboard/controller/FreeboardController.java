package com.store.goguma.freeboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.service.FreeBoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeboardController {

	private final FreeBoardService freeBoardService;
	
	@GetMapping("/main")
	public String boardMain( Model model) {
		
		List<FreeBoardDTO> boardList = freeBoardService.findAllFree();
		List<FreeBoardDTO> recommendationList = freeBoardService.countRecommendation();
		
		log.debug("좋아요:" +recommendationList);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("rDList",recommendationList);
		
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
	


	
	
	@GetMapping("/card")
	public String boardCard() {
		
		return "/free_board/free-card";
	}
	
	@GetMapping("/write")
	public String boardWrite() {
		
		return "/free_board/free-write";
	}
	
}
