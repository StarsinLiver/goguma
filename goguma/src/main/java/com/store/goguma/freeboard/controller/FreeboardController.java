package com.store.goguma.freeboard.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.FreeBoardCountRecommendationByCateDto;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardFormDTO;
import com.store.goguma.freeboard.dto.FreeBoardManyCategoryDto;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.EmojiUploadService;
//import com.store.goguma.freeboard.dto.FreeBoardManyCategoryDto;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.utils.Define;

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
	private final EmojiUploadService fileService;

	@GetMapping("/main")
	public String boardMain( Model model, HttpSession session) {
		
		session.setAttribute("plusFreeView", true);
		List<FreeBoardDTO> boardList = freeBoardService.findAllFree();
		List<FreeBoardDTO> recommendationList = freeBoardService.countRecommendation();
		List<FreeBoardManyCategoryDto> categoryList = freeBoardService.mainFreeBoardCategory();

		int count = 1;
		for (FreeBoardManyCategoryDto i : categoryList) {
			List<FreeBoardCountRecommendationByCateDto> list = freeBoardService.mainFreeBoard(i.getMainCategoryId(),
					i.getSubCategoryId());
			log.info("cateogrygoogogogogogogoog " + count + " {}", list);
			model.addAttribute("categoryList" + count, list);
			model.addAttribute("category" + count, i);
			count++;
		}

		model.addAttribute("boardList", boardList);
		model.addAttribute("rDList", recommendationList);

		return "/free_board/free-main";
	}


	@GetMapping("/list")
	public String boardList() {

		return "/free_board/free-list";
	}

	// aside 테스트용
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

		if (boardFormDTO.getTitle() == null || boardFormDTO.getTitle().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (boardFormDTO.getContent() == null || boardFormDTO.getContent().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_CONTENT, HttpStatus.BAD_REQUEST);
		}
		if (boardFormDTO.getMultipartFile() == null || boardFormDTO.getMultipartFile().getSize() == 0) {
			throw new BackPageRestfulException(Define.NO_VALID_FILE, HttpStatus.BAD_REQUEST);
		}

		String file = fileService.uploadFileProcess(boardFormDTO.getMultipartFile());

		int userId = user.getUId();
		boardFormDTO.setUId(userId);
		boardFormDTO.setFile(file);

		log.info("info : {}", boardFormDTO);

		int result = freeBoardService.insert(boardFormDTO);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return "redirect:/user/board";
	}

	/**
	 * 게시글 수정 폼 이동
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("/write/update/{id}")
	public String boardWriteUpdate(@PathVariable(value = "id") Integer id, Model model) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		FreeBoard board = freeBoardService.findById(id);

		if (board == null) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		model.addAttribute("board", board);
		return "/free_board/free-write-update";
	}

	@PutMapping("/write/update")
	public String putMethodName(FreeBoardFormDTO boardFormDTO) {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		if (boardFormDTO.getTitle() == null || boardFormDTO.getTitle().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_TITLE, HttpStatus.BAD_REQUEST);
		}
		if (boardFormDTO.getContent() == null || boardFormDTO.getContent().isEmpty()) {
			throw new BackPageRestfulException(Define.NO_VALID_CONTENT, HttpStatus.BAD_REQUEST);
		}
		if (boardFormDTO.getMultipartFile() == null || boardFormDTO.getMultipartFile().getSize() == 0) {
			FreeBoard entity = freeBoardService.findById(boardFormDTO.getId());
			boardFormDTO.setFile(entity.getFile());
		} else {
			String file = fileService.uploadFileProcess(boardFormDTO.getMultipartFile());
			boardFormDTO.setFile(file);
		}
		
		int result = freeBoardService.updateFreeBoard(boardFormDTO);
		if (result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return "redirect:/user/board";
	}
}
