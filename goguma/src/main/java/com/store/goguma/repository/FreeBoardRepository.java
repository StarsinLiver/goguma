package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.admin.dto.AdminFreeBoardDto;
import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.FreeBoardDTO;


@Mapper
public interface FreeBoardRepository {

	// 게시글 조회
	public List<FreeBoard> findAllFree();
	
	// 좋아요 개수 카운트
	public List<FreeBoard> countRecommendation();
	
	// 좋아요 추가/삭제
	public int addRecommendation(FreeBoard freeBoard);
	public int deleteRecommendation(FreeBoard freeBoard);


	
	//------------------- 산하
	
	// 게시물 전체 조회
	public List<AdminFreeBoardDto> adminFindAll(@Param("start") int start , @Param("search") String search , @Param("searchType") String searchType);
	public int countAdminFindAll(@Param("search") String search , @Param("searchType") String searchType);
	public int deleteById(int id);
	//------------------- 산하
	
	
	
	
}
