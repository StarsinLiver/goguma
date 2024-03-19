package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.admin.dto.AdminAnswerDto;
import com.store.goguma.admin.dto.AdminQnaDto;
import com.store.goguma.cs.dto.QnaRequestDto;
import com.store.goguma.repository.QnaRepository;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class QnaService {


	private final QnaRepository repository;

	public boolean qnaUserWrite(QnaRequestDto dto) {
		int result = repository.qnaUserWrite(dto.toEntity());
		return result != 0;
	}

	// 관리자에서 1 : 1 문의 내역 확인
	public ResponsePageDTO adminFindAll(RequestPageDTO pageDTO) {
		int start = (pageDTO.getPg() - 1) * pageDTO.getSize();

		List<AdminQnaDto> list = repository.adminFindAll(start, pageDTO.getSearchType(), pageDTO.getSearch());
		int count = repository.countAdminFindAll(pageDTO.getSearchType(), pageDTO.getSearch());

		return ResponsePageDTO.builder().requestPageDTO(pageDTO).dtoList(list).total(count).build();
	}
	
	// qna 상세 조회
	public AdminQnaDto adminFindByQid(int qid) {
		return repository.adminFindByQid(qid);
	}
	
	// qna 답변
	public int adminAnswerQna(AdminAnswerDto adminQnaDto) {
		return repository.adminAnswerQna(adminQnaDto);
	}
	
	// qna 삭제
	public int adminDeleteQna(int id) {
		return repository.adminDeleteQna(id);
	}
}
