package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.BoardTypeDTO;
import com.store.goguma.freeboard.dto.FreeBoardCateListDTO;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardListDTO;
import com.store.goguma.freeboard.dto.FreeBoardPageDTO;
import com.store.goguma.freeboard.dto.FreeBoardResDTO;


@Mapper
public interface FreeBoardRepository {

	// 게시글 조회
	public List<FreeBoard> findAllFree();
	
	// 좋아요 개수 카운트
	public List<FreeBoard> countRecommendation();
	
	// 좋아요 추가/삭제
	public int addRecommendation(FreeBoard freeBoard);
	public int deleteRecommendation(FreeBoard freeBoard);

	
	// 리스트 타입 조회 - y
	public BoardTypeDTO selectArticleType(@Param("cate1") int cate1, @Param("id") int id);

	// 카테고리에 따른 리스트 조회 - y
	public List<FreeBoardResDTO> selectArticleAllBycateNid(FreeBoardPageDTO page);

	// 리스트 페이지 total값
	public int countListTotal(FreeBoardPageDTO page);


	
	
	
	
	
}
