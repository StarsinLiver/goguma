package com.store.goguma.freeboard.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/freeBoard")
@RequiredArgsConstructor
public class FreeBoardReviewController {
	
	private final FreeBoardService freeBoardService;
	private final HttpSession httpSession;
	
	// 댓글 입력
	@PostMapping("/review")
	@ResponseBody
	public int reviewInsert(@RequestBody Map<String, String> data) {
		log.info("reviewInsert : "+data);
		
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		int userId = user.getUId();
		
		
		return 0;
	}
}
