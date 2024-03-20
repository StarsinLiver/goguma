package com.store.goguma.freeboard.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.freeboard.dto.FreeBoardListDTO;
import com.store.goguma.freeboard.dto.FreeBoardPageDTO;
import com.store.goguma.service.FreeBoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeboardRestController {

	private final FreeBoardService freeBoardService;
	
	
	@GetMapping("/listAll")
	@ResponseBody
	public FreeBoardListDTO BoardList(FreeBoardPageDTO page, Model model){

		
		log.info("리스트 컨트롤러 들오는지 확인 해보기 위해 쓰는 로그 ");
		log.info("page dto 확인: "+ page.toString());
		
		
		FreeBoardListDTO result = freeBoardService.selectArticleAllBycateNid(page);
		
		log.info("relust 값 확인 하기: "+ result.toString());
		
		return result;	
	}  
	
	
}
