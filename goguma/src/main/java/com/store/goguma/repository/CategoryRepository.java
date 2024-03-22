package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;

@Mapper
public interface CategoryRepository {

	public List<BoardCategoryMain> getMainList();//수정해야함
	public List<BoardCategorySub> getSubList();//수정해야함


	public int mainCategoryRemove(int id);
	public int subCategoryRemove(int id);
	
	public int mainCategoryModify(BoardCategoryMain entity);
	public int mainCategoryCreate(BoardCategoryMain entity);
	public int subCategoryModify(BoardCategorySub entity);
	public int subCategoryCreate(BoardCategorySub entity);
	public int getMainIndex();

}
