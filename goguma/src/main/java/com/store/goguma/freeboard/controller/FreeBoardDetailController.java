package com.store.goguma.freeboard.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.goguma.freeboard.dto.FreeBoardDetailAndUserDTO;
import com.store.goguma.freeboard.dto.FreeBoardRecommendationDTO;
import com.store.goguma.freeboard.dto.FreeBoardViewDTO;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.report.dto.ReportDTO;
import com.store.goguma.service.FreeBoardRecommendationService;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.service.FreeBoardViewService;
import com.store.goguma.service.ReportService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.utils.Define;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeBoardDetailController {
	
	private final FreeBoardService freeBoardService;
	private final ReportService reportService;
	private final FreeBoardViewService freeBoardViewService;
	private final FreeBoardRecommendationService freeBoardRecommendationService;
	private final HttpSession httpSession;
	
	//freeBoard_detail
	@GetMapping("/detail")
	public String Detail(@RequestParam(value = "id") Integer id, Model model, HttpSession session, Integer freeBoardId) {
		
		// 조회수 세션 저장 (새로고침 조회수 증가 x)
		Boolean plusFreeView = (Boolean) session.getAttribute("plusFreeView");
		if (plusFreeView || plusFreeView == null) {
			freeBoardViewService.plusFreeView(id);
			session.setAttribute("plusFreeView", false);
		}
		
	    OauthDTO user = (OauthDTO) session.getAttribute("principal");
	    Integer uId = null;
	    boolean FBRecommendation = false;

	    if (user != null) {
	        uId = user.getUId();
	        if (id != null) {
	            FBRecommendation = freeBoardRecommendationService.findRecommendation(uId, id);
	        }
	    }
		
		// 상품 조회수 가져오기
		FreeBoardViewDTO currentViews = freeBoardViewService.getFreeView(id);
		// FreeBoardDTO boardCountRDDTO = freeBoardService.detailCountRecommendation(id);
		FreeBoardDetailAndUserDTO boardCountRDDTO = freeBoardService.findByFreeIdJoinUser(id);
		
		log.info("detail {}" , boardCountRDDTO);
		model.addAttribute("boardCountRD",boardCountRDDTO);
		model.addAttribute("currentViews",currentViews);
		model.addAttribute("recommendation",FBRecommendation);
		
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
	    
	    if(hostId == user.getUId()) {
	    	throw new BackPageRestfulException(Define.NO_VALID_REPORT, HttpStatus.BAD_REQUEST);
	    	
	    }

	    reportService.addReport(dto);
	    
		return "redirect:/freeBoard/detail?id="+id;
	}
	
	// 좋아요
	@PostMapping("/addRecommendation")
	public String addWishList(FreeBoardRecommendationDTO dto, @RequestParam(value = "id") Integer id, HttpSession session, Integer freeBoardId) {
	    OauthDTO user = (OauthDTO) session.getAttribute("principal");

	    if (user == null) {
	    	throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus	.INTERNAL_SERVER_ERROR);
	    }
	    dto.setFreeBoardId(freeBoardId);
	    dto.setUId(user.getUId());
	    
	    freeBoardRecommendationService.addRecommendation(dto);

	    return "redirect:/freeBoard/detail?id="+id;
	}
	// 안 좋아요
	@PostMapping("/deleteRecommendation")
	public String deleteRecommendation(FreeBoardRecommendationDTO dto, @RequestParam(value = "id") Integer id, HttpSession session, Integer freeBoardId) {
		OauthDTO user = (OauthDTO) session.getAttribute("principal");
		
		if (user == null) {
			throw new LoginRestfulException(Define.ENTER_YOUR_LOGIN, HttpStatus	.INTERNAL_SERVER_ERROR);
		}
	    dto.setFreeBoardId(freeBoardId);
	    dto.setUId(user.getUId());
		
		freeBoardRecommendationService.deleteRecommendation(dto);

	    return "redirect:/freeBoard/detail?id="+id;
	}
}
