package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.entity.MainEmoji;

@Mapper
public interface EmojiHistoryRepository {

	public List<MainEmoji> findMainEmojiAllByUserId(int userId);
	
	// 유저 결제 내역
	public List<EmojiHistory> findEmojiHistoryByUser(Integer uId);
}
