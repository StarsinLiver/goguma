package com.store.goguma.freeboard.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.entity.MainEmoji;
import com.store.goguma.freeboard.dto.FreeBoardReviewDTO;
import com.store.goguma.freeboard.dto.FreeBoardReviewReqDTO;
import com.store.goguma.freeboard.dto.FreeBoardReviewResDTO;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.repository.EmojiHistoryRepository;
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
	private final EmojiHistoryRepository emojiHistoryRepository;
	
	// 댓글 입력
	@PostMapping("/review")
	@ResponseBody
	public int reviewInsert(@RequestBody FreeBoardReviewDTO dto) {
		log.info("reviewInsert : "+dto);
		
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		int userId = user.getUId();
		
		dto.setUId(userId);
		
		// 최근 댓글 조회
		reviewService.createReview(dto);
		
		return 0;
	}
	
	// 현재 게시물 댓글 조회
	@PostMapping("/detail/review")
	@ResponseBody
	public FreeBoardReviewResDTO reviewList(@RequestBody FreeBoardReviewReqDTO dto) {
		log.info("dto"+dto);
		
		FreeBoardReviewResDTO boardPageResDto = reviewService.findReviewListByBoardId(dto);
		
		return boardPageResDto;
	}
	
	
	// 답글 등록
	@PostMapping("/review/sub")
	@ResponseBody
	public int subReviewInsert(@RequestBody FreeBoardReviewDTO dto) {
		log.info("답글 : "+dto);
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		int userId = user.getUId();
		dto.setUId(userId);
		
		reviewService.createReview(dto);
		
		return 0;
	}
	
	// 내 메인 이모티콘 목록
	@PostMapping("/imoji")
	@ResponseBody
	public List<MainEmoji> reviewImoji() {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		// 모든 메인 이모지 가져오기
        List<MainEmoji> mainEmojiList = emojiHistoryRepository.findMainEmojiAllByUserId(user.getUId());
        log.info(mainEmojiList.toString());
        
        /*
		// 자식 이모티콘
        List<Emoji> emojiList = new ArrayList<>();

        // 메인 이모지의 기본키 ( id ) 배열 만들기 + 자식 이모티콘 찾기
        List<Integer> mainListToInt = new ArrayList<>();
        // mainEmojiList 리스트를 반복하면서 각 요소의 ID를 mainListToInt 리스트에 추가
        if (mainEmojiList != null && mainEmojiList.isEmpty() == false) {
            mainEmojiList.forEach((e) -> mainListToInt.add(e.getId()));
            emojiList = emojiService.findByGroupId(mainListToInt);
        }
        */
        
		return mainEmojiList;
	}
	
	
}