package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FreeBoardViewRepository {
	public int save(int boardId);
}
