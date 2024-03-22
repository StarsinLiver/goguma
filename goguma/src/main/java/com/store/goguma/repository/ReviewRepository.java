package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.freeboard.dto.FreeBoardReviewDTO;

@Mapper
public interface ReviewRepository {

	// 댓글 등록
	public int insertReview(FreeBoardReviewDTO dto);
	
	// 개별 조회
	public FreeBoardReviewDTO selectReviewById(Integer id);
	
	// 현재 게시글 댓글 전체 조회
	public List<FreeBoardReviewDTO> selectAllReviewByBoardId(@Param("freeBoardId") Integer boardId, 
																@Param("start") Integer start,
																@Param("size") Integer size);
	
	public FreeBoardReviewDTO selectReviewByUidLast(Integer uId);
	
	// 현재 게시글 댓글 갯수
	public int countAllReviewByBoardId(Integer boardId);
	
	public int deleteUpdateReviewById(int id);
	public int deleteUpdateReviewByGroupId(int groupId);
}
