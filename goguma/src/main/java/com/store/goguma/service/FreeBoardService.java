package com.store.goguma.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.BoardTypeDTO;
import com.store.goguma.freeboard.dto.FreeBoardCateListDTO;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.freeboard.dto.FreeBoardListDTO;
import com.store.goguma.freeboard.dto.FreeBoardPageDTO;
import com.store.goguma.freeboard.dto.FreeBoardResDTO;
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
		List<FreeBoard> freeBoardList = freeBoardRepository.findAllFree(); // 모든 자유 게시물 조회
		List<FreeBoardDTO> freeBoardDTOList = new ArrayList<>();

		for (FreeBoard freeBoard : freeBoardList) {
			FreeBoardDTO freeBoardDTO = FreeBoardDTO.builder().id(freeBoard.getId()).title(freeBoard.getTitle())
					.content(freeBoard.getTitle()).uId(freeBoard.getUId()).file(freeBoard.getFile())
					.createAt(freeBoard.getCreateAt()).updateAt(freeBoard.getUpdateAt())
					.deleteAt(freeBoard.getDeleteAt()).deleteYn(freeBoard.getDeleteYn()).build();

			freeBoardDTOList.add(freeBoardDTO);

		}
		return freeBoardDTOList;

	}

	// 게시글 좋아요 개수
	public List<FreeBoardDTO> countRecommendation() {
		List<FreeBoard> recommendation = freeBoardRepository.countRecommendation();
		List<FreeBoardDTO> recommendationDTOList = new ArrayList<>();

		for (FreeBoard freeBoard : recommendation) {
			FreeBoardDTO recommendationDTO = FreeBoardDTO.builder().id(freeBoard.getId()).title(freeBoard.getTitle())
					.content(freeBoard.getTitle()).uId(freeBoard.getUId()).file(freeBoard.getFile())
					.createAt(freeBoard.getCreateAt()).updateAt(freeBoard.getUpdateAt())
					.deleteAt(freeBoard.getDeleteAt()).deleteYn(freeBoard.getDeleteYn())
					.goodCount(freeBoard.getGoodCount()).build();
			recommendationDTOList.add(recommendationDTO);

		}
		return recommendationDTOList;

	}

	public BoardTypeDTO selectArticleType(int cate1, int id) {

		
		return freeBoardRepository.selectArticleType(cate1, id); 
	}

	public FreeBoardListDTO selectArticleAllBycateNid(FreeBoardPageDTO page) {
		
		// 리스트 총량 확인
		int total = freeBoardRepository.countListTotal(page);
		
		log.info("프로보드 리스트 서비스단 total: " + total);
		
		int start = (page.getPg() - 1) * page.getSize();
		
		page.setStart(start);
		
		// 리스트 데이터 확인
		List<FreeBoardResDTO> dtoList = freeBoardRepository.selectArticleAllBycateNid(page);
		
		
		
		
		log.info("프로보드 리스트 서비스단 dtoList: " + dtoList);
		log.info("프로보드 리스트 서비스단 dtoList: " + dtoList.toString());
		
		 return FreeBoardListDTO.builder().pageReqDTO(page).dtoList(dtoList).total(total).build();
	}
}
