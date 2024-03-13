package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.EmojiHistory;

@Mapper
public interface MyUserRepository {
	// 유저 결제 내역
	public List<EmojiHistory> findEmojiHistoryByUser(@Param("uId") Integer uId, @Param("start") Integer start);
	
	// 유저 결제 내역 갯수
	public int countEmojiHistoryByUser(Integer uId);
}
