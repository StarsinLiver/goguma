package com.store.goguma.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.store.goguma.admin.dto.AdminFreeBoardDto;
import com.store.goguma.entity.FreeBoard;
import com.store.goguma.freeboard.dto.FreeBoardDTO;
import com.store.goguma.repository.FreeBoardRepository;
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

	// ----------- 산하
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
	
	public int deleteById(int id) {
		return freeBoardRepository.deleteById(id);
	}
	// ----------- 산하
	
	
}
