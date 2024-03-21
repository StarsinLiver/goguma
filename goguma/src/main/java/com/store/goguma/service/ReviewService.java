package com.store.goguma.service;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.freeboard.dto.FreeBoardReviewDTO;
import com.store.goguma.freeboard.dto.FreeBoardReviewReqDTO;
import com.store.goguma.freeboard.dto.FreeBoardReviewResDTO;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReviewService {

	
	private final ReviewRepository reviewRepository;
	
	// 댓글 등록
	@Transactional
	public FreeBoardReviewDTO createReview(FreeBoardReviewDTO dto) {
		int result = reviewRepository.insertReview(dto);
		
		// 댓글 생성 여부
		if(result < 1) {
			throw new BackPageRestfulException("댓글이 정상적으로 생성되지 않았습니다.", HttpStatus.BAD_REQUEST);
		}
		
		// 가장 최근에 작성된 내 댓글 조회
		int uId = dto.getUId();
		FreeBoardReviewDTO review = reviewRepository.selectReviewByUidLast(uId);
		
		return review;
	}
	
	// 게시글 댓글 전체 조회
	public FreeBoardReviewResDTO findReviewListByBoardId(FreeBoardReviewReqDTO dto) {
		int start = (dto.getPg() - 1) * dto.getSize();
		int size = dto.getSize();
		int boardId = dto.getId();
		
		List<FreeBoardReviewDTO> dtoList = reviewRepository.selectAllReviewByBoardId(boardId, start,size);
		int total = reviewRepository.countAllReviewByBoardId(boardId);
		
		return FreeBoardReviewResDTO.builder()
					.requestPageDTO(dto)
					.dtoList(dtoList)
					.total(total)
					.build();
	}
}
