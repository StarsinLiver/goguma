package com.store.goguma.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.store.goguma.admin.dto.AdminFreeBoardDto;
import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;
import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.FreeBoardCountRecommendationByCateDto;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardFormDTO;
import com.store.goguma.freeboard.dto.FreeBoardManyCategoryDto;
import com.store.goguma.freeboard.dto.UserFreeBoardPageReqDto;
import com.store.goguma.freeboard.dto.UserFreeBoardPageResDto;
import com.store.goguma.repository.FreeBoardRepository;
import com.store.goguma.user.dto.FreeBoardDto;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreeBoardService {

	final private FreeBoardRepository freeBoardRepository;

	// 게시글 리스트
	public List<FreeBoardDTO> findAllFree() {
		List<FreeBoard> freeBoardList = freeBoardRepository.findAllFree();
		List<FreeBoardDTO> freeBoardDTOList = new ArrayList<>();

		for (FreeBoard freeBoard : freeBoardList) {
			FreeBoardDTO freeBoardDTO = FreeBoardDTO.builder().id(freeBoard.getId()).title(freeBoard.getTitle())
					.content(freeBoard.getTitle()).uId(freeBoard.getUId()).file(freeBoard.getFile())
					.createAt(freeBoard.getCreateAt()).updateAt(freeBoard.getUpdateAt())
					.deleteAt(freeBoard.getDeleteAt()).deleteYn(freeBoard.getDeleteYn())
//					.mainCategory(freeBoard.getMainCategory())
//					.subCategory(freeBoard.getSubCategory())
					.build();

			freeBoardDTOList.add(freeBoardDTO);

		}
		return freeBoardDTOList;

	}

	// 좋아요 많은 순서
	public List<FreeBoardDTO> countRecommendation() {
		List<FreeBoard> recommendation = freeBoardRepository.countRecommendation();
		List<FreeBoardDTO> recommendationDTOList = new ArrayList<>();

		for (FreeBoard freeBoard : recommendation) {
			FreeBoardDTO recommendationDTO = FreeBoardDTO.builder().id(freeBoard.getId()).title(freeBoard.getTitle())
					.content(freeBoard.getTitle()).uId(freeBoard.getUId()).file(freeBoard.getFile())
					.createAt(freeBoard.getCreateAt()).updateAt(freeBoard.getUpdateAt())
					.deleteAt(freeBoard.getDeleteAt()).deleteYn(freeBoard.getDeleteYn())
//					.mainCategory(freeBoard.getMainCategory()).subCategory(freeBoard.getSubCategory())
					.goodCount(freeBoard.getGoodCount()).build();

			recommendationDTOList.add(recommendationDTO);

		}
		return recommendationDTOList;

	}

	
	// 게시글 등록
	public int insert(FreeBoardFormDTO boardDTO) {
		return freeBoardRepository.insertFreeBoard(boardDTO);
	}


	// ----------- 산하
	/**
	 * 관리자 에서 모든 게시물 검색
	 * @param pageDTO
	 * @return
	 */
	public ResponsePageDTO adminFindAll(RequestPageDTO pageDTO) {
		int start = (pageDTO.getPg() -1) * pageDTO.getSize();
		
		List<AdminFreeBoardDto> list = freeBoardRepository.adminFindAll(start , pageDTO.getSearch() , pageDTO.getSearchType());
		int count = freeBoardRepository.countAdminFindAll(pageDTO.getSearch() , pageDTO.getSearchType());
		return ResponsePageDTO.builder()
				.requestPageDTO(pageDTO)
				.dtoList(list)
				.total(count)
				.build();
	}
	
	/*
	 * 게시물 삭제하기
	 */
	public int deleteById(int id) {
		return freeBoardRepository.deleteById(id);
	}
	
	/**
	 * 유저의 게시물 가져오기
	 * @param page
	 * @param userId
	 * @return
	 */
	public UserFreeBoardPageResDto findByUserId(UserFreeBoardPageReqDto page , int userId) {
		int start = (page.getPg() -1) * page.getSize();
		List<FreeBoardDto> list = freeBoardRepository.findByUserId(start, page.getSearch(), page.getSearchType(), userId, page.getMainCategory(), page.getSubCategory());
		int count = freeBoardRepository.countFindByUserId(page.getSearch(), page.getSearchType(), userId, page.getMainCategory(), page.getSubCategory());
		
		return UserFreeBoardPageResDto.builder()
				.requestPageDTO(page)
				.dtoList(list)
				.total(count)
				.build();
	}
	/**
	 * 유저의 메인 카테고리 검색
	 * @param userId
	 * @return
	 */
	public List<BoardCategoryMain> findMainCategoryByUserId(int userId) {
		return freeBoardRepository.findMainCategoryByUserId(userId);
	}
	
	/**
	 * 유저가 작성한 글의 메인 카테고리에 맞는 서브 카테고리 찾기
	 * @param userId
	 * @param groupId
	 * @return
	 */
	public List<BoardCategorySub> findSubCategoryByMainCateogry(int userId , int groupId) {
		return freeBoardRepository.findSubCategoryByMainCateogry(userId, groupId);
	}
	// ----------- 산하
	

	public List<FreeBoardManyCategoryDto> mainFreeBoardCategory() {
		List<FreeBoardManyCategoryDto> manyCategory = freeBoardRepository.manyFreeBoard();
		return manyCategory;
	}
	
	public List<FreeBoardCountRecommendationByCateDto> mainFreeBoard(int mainCategoryId , int subCategoryId) {
		return freeBoardRepository.countRecommendationByCate(mainCategoryId, subCategoryId);
	}
	
	public FreeBoardDTO findByFreeId(Integer id) {
		
		FreeBoard freeBoard = freeBoardRepository.findByFreeId(id);
		
		FreeBoardDTO dto = FreeBoardDTO.builder().id(freeBoard.getId()).title(freeBoard.getTitle())
				.content(freeBoard.getTitle()).uId(freeBoard.getUId()).file(freeBoard.getFile())
				.createAt(freeBoard.getCreateAt()).updateAt(freeBoard.getUpdateAt())
				.deleteAt(freeBoard.getDeleteAt()).deleteYn(freeBoard.getDeleteYn())
//				.mainCategory(freeBoard.getMainCategory()).subCategory(freeBoard.getSubCategory())
				.goodCount(freeBoard.getGoodCount()).build();
		
		return dto;
		
		
	}

}
