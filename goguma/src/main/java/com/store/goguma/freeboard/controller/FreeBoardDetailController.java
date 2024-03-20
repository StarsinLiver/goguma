package com.store.goguma.freeboard.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.service.FreeBoardService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeBoardDetailController {
	
	private final FreeBoardService freeBoardService;

	//freeBoard_detail
	@GetMapping("/detail")
	public String Detail(@RequestParam(value = "id") Integer id, Model model) {
		
		FreeBoardDTO freeBoardDTO = freeBoardService.findByFreeId(id);
		
		model.addAttribute("freeBoard",freeBoardDTO);
		
		return "free_board/free_board_detail";
		
	}
	
	
	
}
