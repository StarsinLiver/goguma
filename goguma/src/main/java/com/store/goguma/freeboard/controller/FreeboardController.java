package com.store.goguma.freeboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.freeboard.dto.FreeBoardCountRecommendationByCateDto;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardManyCategoryDto;
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
		List<FreeBoardManyCategoryDto> categoryList = freeBoardService.mainFreeBoardCategory();
		
		int count = 1;
		for(FreeBoardManyCategoryDto i : categoryList) {
			List<FreeBoardCountRecommendationByCateDto> list = freeBoardService.mainFreeBoard(i.getMainCategoryId(), i.getSubCategoryId());
			log.info("cateogrygoogogogogogogoog " + count + " {}" , list);
			model.addAttribute("categoryList" + count , list);
			model.addAttribute("category" + count , i);
			count++;
		}
		
		model.addAttribute("boardList" , boardList);
		model.addAttribute("rDList" , recommendationList);
		
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
	
	
	@GetMapping("/card")
	public String boardCard() {
		
		return "/free_board/free-card";
	}
	
	@GetMapping("/write")
	public String boardWrite() {
		
		return "/free_board/free-write";
	}
	
	
}
