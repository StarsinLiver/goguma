package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.FreeBoardRecommendation;

@Mapper
public interface FreeBoardRecommendationRepository {

	public int addRecommendation(FreeBoardRecommendation freeBoardRecommendation);
	
	public int deleteRecommendation(FreeBoardRecommendation freeBoardRecommendation);

	public int findRecommendation(@Param("freeBoardId") int freeBoardId, @Param("uId") int uId);
}
