package com.store.goguma.freeboard.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.emoji.dto.EmojiListMainAndSubDto;
import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.MainEmoji;
import com.store.goguma.freeboard.dto.FreeBoardReviewDTO;
import com.store.goguma.freeboard.dto.FreeBoardReviewReqDTO;
import com.store.goguma.freeboard.dto.FreeBoardReviewResDTO;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.repository.EmojiHistoryRepository;
import com.store.goguma.service.EmojiService;
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
	private final EmojiService emojiService;

	// 댓글 입력
	@PostMapping("/review")
	@ResponseBody
	public int reviewInsert(@RequestBody FreeBoardReviewDTO dto) {
		log.info("reviewInsert : " + dto);

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int userId = user.getUId();

		dto.setUId(userId);

		log.info("댓글 등록 : {}" , dto);
		
		// 최근 댓글 조회
		reviewService.createReview(dto);

		return 0;
	}

	// 현재 게시물 댓글 조회
	@PostMapping("/detail/review")
	@ResponseBody
	public FreeBoardReviewResDTO reviewList(@RequestBody FreeBoardReviewReqDTO dto) {
		log.info("dto" + dto);

		FreeBoardReviewResDTO boardPageResDto = reviewService.findReviewListByBoardId(dto);
		log.info("현재 : "+boardPageResDto);	
		return boardPageResDto;
	}

	// 답글 등록
	@PostMapping("/review/sub")
	@ResponseBody
	public int subReviewInsert(@RequestBody FreeBoardReviewDTO dto) {
		log.info("답글 : " + dto);
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
	public List<EmojiListMainAndSubDto> reviewImoji() {
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		try {

			// 회원, 비회원 검증
			if (user == null) {
				throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
			}

			// 모든 메인 이모지 가져오기
			List<MainEmoji> mainEmojiList = emojiHistoryRepository.findMainEmojiAllByUserId(user.getUId());
			log.info(mainEmojiList.toString());

			// 자식 이모티콘
			List<Emoji> emojiList = new ArrayList<>();

			// 메인 이모지의 기본키 ( id ) 배열 만들기 + 자식 이모티콘 찾기
			List<Integer> mainListToInt = new ArrayList<>();
			// mainEmojiList 리스트를 반복하면서 각 요소의 ID를 mainListToInt 리스트에 추가
			if (mainEmojiList != null && mainEmojiList.isEmpty() == false) {
				mainEmojiList.forEach((e) -> mainListToInt.add(e.getId()));
				emojiList = emojiService.findByGroupId(mainListToInt);
			}
			log.info("메인 : " + mainEmojiList);
			log.info("서브 : " + emojiList);

			List<EmojiListMainAndSubDto> mainAndSub = new ArrayList<>();
			// 메인과 서브 함치기
			for(MainEmoji i : mainEmojiList) {
				
				List<Emoji> list = emojiList.stream().filter((e) -> e.getGroupId() == i.getId() ? true : false).collect(Collectors.toList());
				EmojiListMainAndSubDto dto = EmojiListMainAndSubDto.builder()
						.mainEmoji(i).subEmoji(list).build();
				mainAndSub.add(dto);
			}

			return mainAndSub;
		} catch (Exception e) {
			log.info(e.getMessage());
			return null;
		}
	}
	
	// 내 메인 이모티콘 목록
	@DeleteMapping("/review/delete/{id}")
	@ResponseBody
	public ResponseEntity<?> deleteReview(@PathVariable("id") int id) {
		log.info("삭제될 아이디 값 : "+id);
		try {
			
		
		// 유효성 검증
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
	
		// 개별 조회
		FreeBoardReviewDTO dto = reviewService.selectReviewById(id);
		if(dto == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		log.info("dto : {}" , dto);
		// 삭제 함수
		int result = 0;
		if(dto.getReviewGroup() == null) {
			// 그룹 전체 삭제
			result = reviewService.deleteUpdateReviewByGroupId(id);
			result = reviewService.deleteUpdateReviewById(id);
		} else {
			// 리뷰 하나만 삭제
			result = reviewService.deleteUpdateReviewById(id);
		}
		
		if(result == 0) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return new ResponseEntity<>(HttpStatus.OK);
		}catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

}