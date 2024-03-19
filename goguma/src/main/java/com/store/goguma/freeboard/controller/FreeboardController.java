package com.store.goguma.freeboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.goguma.freeboard.dto.BoardTypeDTO;
import com.store.goguma.freeboard.dto.FreeBoardCateListDTO;
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
	@GetMapping(value = "/list", params={"cate1","id"})
	public String boardList(@RequestParam("cate1")int cate1, @RequestParam("id")int id, Model model) {
		
		// 값들어옴 확인했음 테스트 주소 http://localhost/freeBoard/list?cate1=1&cate2=1&name=잡담
		log.info("cate1 "+cate1);
		
		
		// 게시판 형식 일단 게시판 형식부터 ㄱ
		BoardTypeDTO listType = freeBoardService.selectArticleType(cate1, id);
		
		log.info("프리보드 리스트 컨트롤러 리스트 타입 값 확인"+listType.toString());
		
		// 게시판 목록  페이징 하삼
		//freeBoardService.selectArticleAllBycate(cate1, cate2);
		
		model.addAttribute("type", listType);
		
		
		return "/free_board/free-list";
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
