package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.admin.dto.AdminFreeBoardDto;
import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;
import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardFormDTO;
import com.store.goguma.freeboard.dto.FreeBoardCountRecommendationByCateDto;
import com.store.goguma.freeboard.dto.FreeBoardManyCategoryDto;
import com.store.goguma.user.dto.FreeBoardDto;


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
	
	// 등록 
	public int insertFreeBoard(FreeBoardFormDTO dto);
	// 게시글 많은 카테고리
	public List<FreeBoardManyCategoryDto> manyFreeBoard();

	public FreeBoard findByFreeId(Integer id);
	public FreeBoard detailCountRecommendation(Integer id);
	

	
	//------------------- 산하
	
	// 게시물 전체 조회
	public List<AdminFreeBoardDto> adminFindAll(@Param("start") int start , @Param("search") String search , @Param("searchType") String searchType , @Param("mainCategory") int mainCateogry , @Param("subCategory") int subCategory);
	public int countAdminFindAll(@Param("search") String search , @Param("searchType") String searchType , @Param("mainCategory") int mainCateogry , @Param("subCategory") int subCategory);
	public int deleteById(int id);
	
	// 사용자 게시물 조회
	public List<FreeBoardDto> findByUserId(@Param("start") int start , @Param("search") String search , @Param("searchType") String searchType , @Param("userId") int userId , @Param("mainCategory") int mainCateogry , @Param("subCategory") int subCategory);
	public int countFindByUserId( @Param("search") String search , @Param("searchType") String searchType , @Param("userId") int userId , @Param("mainCategory") int mainCateogry , @Param("subCategory") int subCategory);
	
	// 메인 카테고리 가져오기
	public List<BoardCategoryMain> findMainCategoryByUserId(int userId);
	public List<BoardCategorySub> findSubCategoryByMainCateogry(@Param("userId") int userId , @Param("groupId") int groupId);
	
	public int deleteBoardById (@Param("boardList") List<Integer> boardList);
	
	public FreeBoard findById(int id);
	public int updateFreeBoard(FreeBoardFormDTO dto);
	//------------------- 산하
	
	
	
	
}
