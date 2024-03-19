package com.store.goguma.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;
import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.BoardCategoryMainDTO;
import com.store.goguma.freeboard.dto.BoardCategorySubDTO;
import com.store.goguma.freeboard.dto.FreeBoardCountRecommendationByCateDto;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardManyCategoryDto;
import com.store.goguma.repository.FreeBoardRepository;

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
					.mainCategory(freeBoard.getMainCategory()).subCategory(freeBoard.getSubCategory()).build();

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
					.mainCategory(freeBoard.getMainCategory()).subCategory(freeBoard.getSubCategory())
					.goodCount(freeBoard.getGoodCount()).build();

			recommendationDTOList.add(recommendationDTO);

		}
		return recommendationDTOList;

	}

	public List<FreeBoardManyCategoryDto> mainFreeBoardCategory() {
		List<FreeBoardManyCategoryDto> manyCategory = freeBoardRepository.manyFreeBoard();
		return manyCategory;
	}
	
	public List<FreeBoardCountRecommendationByCateDto> mainFreeBoard(int mainCategoryId , int subCategoryId) {
		return freeBoardRepository.countRecommendationByCate(mainCategoryId, subCategoryId);
	}
}
