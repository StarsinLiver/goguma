package com.store.goguma.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.repository.FreeBoardRepository;
import com.store.goguma.repository.FreeBoardViewRepository;
import com.store.goguma.user.dto.FreeBoardDto;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;
import com.store.goguma.utils.Define;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class FreeBoardService {

	private final FreeBoardViewRepository freeBoardViewRepository;
	private final FreeBoardRepository freeBoardRepository;

	// 게시글 리스트
	public List<FreeBoardDTO> findAllFree() {
		List<FreeBoard> freeBoardList = freeBoardRepository.findAllFree();
		List<FreeBoardDTO> freeBoardDTOList = new ArrayList<>();

		for (FreeBoard freeBoard : freeBoardList) {
			FreeBoardDTO freeBoardDTO = FreeBoardDTO.builder().id(freeBoard.getId()).title(freeBoard.getTitle())
					.content(freeBoard.getContent()).uId(freeBoard.getUId()).file(freeBoard.getFile())
					.createAt(freeBoard.getCreateAt()).updateAt(freeBoard.getUpdateAt())
					.deleteAt(freeBoard.getDeleteAt()).deleteYn(freeBoard.getDeleteYn())
					.mainCategory(freeBoard.getMainCategory())
					.subCategory(freeBoard.getSubCategory())
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
					.content(freeBoard.getContent()).uId(freeBoard.getUId()).file(freeBoard.getFile())
					.createAt(freeBoard.getCreateAt()).updateAt(freeBoard.getUpdateAt())
					.deleteAt(freeBoard.getDeleteAt()).deleteYn(freeBoard.getDeleteYn())
					.mainCategory(freeBoard.getMainCategory()).subCategory(freeBoard.getSubCategory())
					.goodCount(freeBoard.getGoodCount()).build();

			recommendationDTOList.add(recommendationDTO);

		}
		return recommendationDTOList;

	}

	
	// 게시글 등록
	@Transactional
	public int insert(FreeBoardFormDTO boardDTO) {
		int result = freeBoardRepository.insertFreeBoard(boardDTO);
		
		if(result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		result = freeBoardViewRepository.save(boardDTO.getId());
		
		
		return result;
	}


	// ----------- 산하
	/**
	 * 관리자 에서 모든 게시물 검색
	 * @param pageDTO
	 * @return
	 */
	public ResponsePageDTO adminFindAll(RequestPageDTO pageDTO) {
		int start = (pageDTO.getPg() -1) * pageDTO.getSize();
		
		List<AdminFreeBoardDto> list = freeBoardRepository.adminFindAll(start , pageDTO.getSearch() , pageDTO.getSearchType() , pageDTO.getMainCategory() , pageDTO.getSubCategory());
		int count = freeBoardRepository.countAdminFindAll(pageDTO.getSearch() , pageDTO.getSearchType() , pageDTO.getMainCategory() , pageDTO.getSubCategory());
		return ResponsePageDTO.builder()
				.requestPageDTO(pageDTO)
				.dtoList(list)
				.total(count)
				.build();
	}
	
	/*
	 * 게시물 삭제하기
	 */
	@Transactional
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
	
	
	
	/**
	 * 전체 삭제
	 * @param list
	 * @return
	 */
	@Transactional
	public int deleteBoardById(List<Integer> list) {
		return freeBoardRepository.deleteBoardById(list);
	}
	
	/**
	 * 상세 조회
	 * @param id
	 * @return
	 */
	public FreeBoard findById(int id) {
		return freeBoardRepository.findById(id);
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
				.content(freeBoard.getContent()).uId(freeBoard.getUId()).file(freeBoard.getFile())
				.createAt(freeBoard.getCreateAt()).updateAt(freeBoard.getUpdateAt())
				.deleteAt(freeBoard.getDeleteAt()).deleteYn(freeBoard.getDeleteYn())
				.mainCategory(freeBoard.getMainCategory()).subCategory(freeBoard.getSubCategory())
				.goodCount(freeBoard.getGoodCount()).build();
		
		return dto;
		
	}
	public FreeBoardDTO detailCountRecommendation(Integer id) {
		
		FreeBoard boardCountRD = freeBoardRepository.detailCountRecommendation(id);
		
		FreeBoardDTO dto = FreeBoardDTO.builder().id(boardCountRD.getId()).title(boardCountRD.getTitle())
				.content(boardCountRD.getContent()).uId(boardCountRD.getUId()).file(boardCountRD.getFile())
				.createAt(boardCountRD.getCreateAt()).updateAt(boardCountRD.getUpdateAt())
				.deleteAt(boardCountRD.getDeleteAt()).deleteYn(boardCountRD.getDeleteYn())
				.mainCategory(boardCountRD.getMainCategory()).subCategory(boardCountRD.getSubCategory())
				.goodCount(boardCountRD.getGoodCount()).build();
		
		return dto;
		
	}
	
	/**
	 * 게시글 수정
	 * @param dto
	 * @return
	 */
	@Transactional
	public int updateFreeBoard(FreeBoardFormDTO dto) {
		return freeBoardRepository.updateFreeBoard(dto);
	}

}
