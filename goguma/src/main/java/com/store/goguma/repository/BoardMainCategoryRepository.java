package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.BoardCategoryMain;

@Mapper
public interface BoardMainCategoryRepository {

	public List<BoardCategoryMain> findAll();
}
