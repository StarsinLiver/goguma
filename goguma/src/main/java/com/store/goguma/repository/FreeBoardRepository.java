package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;

import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.FreeBoardCountRecommendationByCateDto;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardManyCategoryDto;


@Mapper
public interface FreeBoardRepository {

	// 게시글 조회
	public List<FreeBoard> findAllFree();
	
	// 좋아요 개수 카운트
	public List<FreeBoard> countRecommendation();
	public List<FreeBoardCountRecommendationByCateDto> countRecommendationByCate(@Param("mainCategoryId") int mainCategoryId , @Param("subCategoryId") int subCategoryId);
	
	// 좋아요 추가/삭제
	public int addRecommendation(FreeBoard freeBoard);
	public int deleteRecommendation(FreeBoard freeBoard);

	// 게시글 많은 카테고리
	public List<FreeBoardManyCategoryDto> manyFreeBoard();

	public FreeBoard findByFreeId(Integer id);
	

	
	
	
	
	
	
}
