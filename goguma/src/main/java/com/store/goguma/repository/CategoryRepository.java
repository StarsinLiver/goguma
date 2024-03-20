package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;

@Mapper
public interface CategoryRepository {

	public int cate1Save(BoardCategoryMain entity);

	public int cate2Save(BoardCategorySub entity);

	public int mainDelete();

	public int subDelete();

	public List<BoardCategoryMain> getMainList();

	public List<BoardCategorySub> getSubList();

}
