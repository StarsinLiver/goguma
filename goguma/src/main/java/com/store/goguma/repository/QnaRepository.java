package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.Qna;

@Mapper
public interface QnaRepository {

	int qnaUserWrite(Qna entity);

}
