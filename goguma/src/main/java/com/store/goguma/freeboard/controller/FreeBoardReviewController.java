package com.store.goguma.freeboard.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.freeboard.dto.FreeBoardReviewDTO;
import com.store.goguma.freeboard.dto.FreeBoardReviewReqDTO;
import com.store.goguma.freeboard.dto.FreeBoardReviewResDTO;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.ReviewService;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeBoardReviewController {
	
	private final HttpSession httpSession;
	private final ReviewService reviewService;
	
	// 댓글 입력
	@PostMapping("/review")
	@ResponseBody
	public FreeBoardReviewDTO reviewInsert(@RequestBody FreeBoardReviewDTO dto) {
		log.info("reviewInsert : "+dto);
		
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		int userId = user.getUId();
		
		dto.setUId(userId);
		
		// 최근 댓글 조회
		FreeBoardReviewDTO newReview = reviewService.createReview(dto);
		log.info("newReview : "+newReview);
		
		return newReview;
	}
	
	// 현재 게시물 댓글 조회
	@PostMapping("/detail/review")
	@ResponseBody
	public FreeBoardReviewResDTO reviewList(@RequestBody FreeBoardReviewReqDTO dto) {
		log.info("dto"+dto);
		
		FreeBoardReviewResDTO boardPageResDto = reviewService.findReviewListByBoardId(dto);
		log.info("현재 게시물 댓글 전체 : "+boardPageResDto);
		
		return boardPageResDto;
	}
}
