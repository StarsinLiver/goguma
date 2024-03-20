package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardDetailDTO;
import com.store.goguma.freeboard.dto.FreeBoardFormDTO;


@Mapper
public interface FreeBoardRepository {

	// 게시글 조회
	public List<FreeBoard> findAllFree();
	
	// 좋아요 개수 카운트
	public List<FreeBoard> countRecommendation();
	
	// 좋아요 추가/삭제
	public int addRecommendation(FreeBoard freeBoard);
	public int deleteRecommendation(FreeBoard freeBoard);
	
	// 상세 조회
	public FreeBoardDetailDTO selectByFid(Integer fId);
	
	// 등록 
	public int insertFreeBoard(FreeBoardFormDTO dto);
	
	
	
	
	
}
