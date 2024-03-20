package com.store.goguma.freeboard.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardDetailDTO;
import com.store.goguma.freeboard.dto.FreeBoardFormDTO;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeboardController {

	private final FreeBoardService freeBoardService;
	private final HttpSession httpSession;
	
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
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (user == null) {
            throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
        }
		
		return "/free_board/free-write";
	}
	
	// 게시글 등록
	@PostMapping("/write")
	public String write(FreeBoardFormDTO boardFormDTO) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		int userId = user.getUId();
		boardFormDTO.setUId(userId);
		
		freeBoardService.insert(boardFormDTO);
		
		
		return "redirect:/free_board/list";
	}
	
	// 게시글 상세
	@GetMapping("/detail/{fId}")
	public String DetailFid(@PathVariable("fId") int fId, Model model) {
		log.info("fid : "+fId);
		
		FreeBoardDetailDTO board = freeBoardService.findById(fId);
		log.info("게시글 : "+board);
		model.addAttribute("board", board);
		
		return "free_board/free_board_detail";
		
	}
	
}
