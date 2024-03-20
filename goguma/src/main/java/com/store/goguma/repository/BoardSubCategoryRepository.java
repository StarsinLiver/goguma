package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.BoardCategorySub;

@Mapper
public interface BoardSubCategoryRepository {

	public List<BoardCategorySub> findByGroupId(int groupId);
}
