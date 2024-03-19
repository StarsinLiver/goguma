package com.store.goguma.freeboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	// 자유 게시판 메인화면
	@GetMapping("/main")
	public String boardMain( Model model) {
		
		List<FreeBoardDTO> boardList = freeBoardService.findAllFree();
		List<FreeBoardDTO> recommendationList = freeBoardService.countRecommendation();
		
		log.debug("좋아요:" +recommendationList);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("rDList",recommendationList);
		
		return "/free_board/free-main";
	}
	
	// list타입 게시글 목록
	@GetMapping("/list")
	public String boardList(@RequestParam("cate1")int cate1, @RequestParam("cate2")int cate2 ) {
		
		// 게시판 형식
		//service.selectArticleType(cate1, cate2);
		
		
		// 게시판 목록
		//service.selectArticleAllBycate(cate1, cate2);
		
		return "/free_board/free-list";
	}
	
	//aside 테스트용
	@GetMapping("/aside")
	public String aside() {
		
		
		return "free_board/free_board_aside";
		
	}
	
	// 자유 게시판 상세 보기
	@GetMapping("/detail")
	public String Detail() {
		
		
		return "free_board/free_board_detail";
		
	}
	


	
	// 자유 게시판 카드 형식 글 목록
	@GetMapping("/card")
	public String boardCard() {
		
		return "/free_board/free-card";
	}
	
	// 자유 게시판 글 작성
	@GetMapping("/write")
	public String boardWrite() {
		
		return "/free_board/free-write";
	}
	
}
