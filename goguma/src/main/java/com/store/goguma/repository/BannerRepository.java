package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.Banner;
import com.store.goguma.utils.BannerType;

@Mapper
public interface BannerRepository {
	
	// 배너 전체 조회
	public List<Banner> findAll(@Param("start") int start , @Param("search") String search , @Param("searchType") String searchType);
	public int countFindAll(@Param("search") String search , @Param("searchType") String searchType);
	
	// 배너 상세 조회
	public Banner findById(int id);
	
	// 배너 등록
	public int insert(Banner banner);
	
	// 배너 업데이트
	public int update(Banner banner);
	
	// 배너 삭제
	public int delete(int id);
	
	// 배너 삭제
	public List<Banner> findByAll(BannerType type);
	
	// 배너 뷰카운트 증가
	public void plusBannerViewCount(Integer id);
}
