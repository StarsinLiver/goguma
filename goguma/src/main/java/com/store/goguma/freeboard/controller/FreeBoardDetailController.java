package com.store.goguma.freeboard.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.report.dto.ReportDTO;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.service.ReportService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.utils.Define;

import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.http.HttpStatus;
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
	private final ReportService reportService;
	
	//freeBoard_detail
	@GetMapping("/detail")
	public String Detail(@RequestParam(value = "id") Integer id, Model model) {
		
		//FreeBoardDTO freeBoardDTO = freeBoardService.findByFreeId(id);
		FreeBoardDTO boardCountRDDTO = freeBoardService.detailCountRecommendation(id);
		
		log.info("hgoianhgboiarehnoarehla : " + boardCountRDDTO);
		
		//model.addAttribute("freeBoard",freeBoardDTO);
		model.addAttribute("boardCountRD",boardCountRDDTO);
		
		return "free_board/free_board_detail";
		
	}
	
	// 유저 신고
	@PostMapping("/addReport")
	public String addReport(ReportDTO dto,@RequestParam(value = "id") Integer id, Integer hostId, HttpSession session) {
	    OauthDTO user = (OauthDTO) session.getAttribute("principal");

	    if (user == null) {
	    	throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus	.INTERNAL_SERVER_ERROR);
	    }
	    
	    dto.setHostId(hostId);
	    dto.setCallId(user.getUId());

	    reportService.addReport(dto);
	    
		return "redirect:/freeBoard/detail?id="+id;
	}
	
}
