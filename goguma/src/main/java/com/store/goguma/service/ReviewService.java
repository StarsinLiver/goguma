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
	public int createReview(FreeBoardReviewDTO dto) {
		int result = reviewRepository.insertReview(dto);
		
		// 댓글 생성 여부
		if(result < 1) {
			throw new BackPageRestfulException("댓글이 정상적으로 생성되지 않았습니다.", HttpStatus.BAD_REQUEST);
		}
		
		return result;
	}
	
	/**
	 * 개별 조회
	 * @param id
	 * @return
	 */
	public FreeBoardReviewDTO selectReviewById (int id) {
		return reviewRepository.selectReviewById(id);
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
	
	// 개별 하나만 삭제
	public int deleteUpdateReviewById(int id) {
		return reviewRepository.deleteUpdateReviewById(id);
	}
	
	// 그룹 전체 삭제
	public int deleteUpdateReviewByGroupId(int groupId) {
		return reviewRepository.deleteUpdateReviewByGroupId(groupId);
	}
}
