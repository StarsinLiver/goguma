package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.freeboard.dto.FreeBoardViewDTO;

@Mapper
public interface FreeBoardViewRepository {
	public int save(int boardId);
    public int plusFreeView(int freeBoardId);
    public FreeBoardViewDTO getFreeView(int freeBoardId);
}
