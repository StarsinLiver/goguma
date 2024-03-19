package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.Notice;

@Mapper
public interface NoticeRepository {

	public List<com.store.goguma.entity.Notice> getNoticeList();
	
	public List<Notice> adminFindAll(@Param("start") int start , @Param("search") String search , @Param("searchType") String searchType);
	
	public int countAdminFindAll(@Param("search") String search , @Param("searchType") String searchType);

	public Notice getNoticeDetail(int id);

	public int getNoticeWrite(Notice entity);

	public int noticeDelete(int id);

	public int noticeUpdate(Notice entity);

	public List<Notice>  findLimitEightFromMain();
}
