package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProductHistoryRepository {
	public int countProductHistoryAll();
	
	public int save(@Param("pId") Integer pId , @Param("userId") Integer userId);
	
	public int countTemperatureUser(int userId);
}
