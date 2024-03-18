package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.admin.dto.AdminAnswerDto;
import com.store.goguma.admin.dto.AdminQnaDto;
import com.store.goguma.entity.Qna;

@Mapper
public interface QnaRepository {

	int qnaUserWrite(Qna entity);

	// 관리자에서 1 : 1 문의 내역 확인
	public List<AdminQnaDto> adminFindAll(@Param("start") int start , @Param("optionName") String optionName , @Param("search") String search);
	public int countAdminFindAll(@Param("optionName") String optionName , @Param("search") String search);
	
	// 관리자 상세 조회
	public AdminQnaDto adminFindByQid(int qid);
	
	// 관리자 답변
	public int adminAnswerQna(AdminAnswerDto adminAnswerDto);
	
	// 관리자 QNA 삭제
	public int adminDeleteQna(int id);
}
