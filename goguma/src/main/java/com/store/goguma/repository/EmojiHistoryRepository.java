package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.EmojiHistory;
import com.store.goguma.entity.MainEmoji;

@Mapper
public interface EmojiHistoryRepository {

	public List<MainEmoji> findMainEmojiAllByUserId(int userId);

	public List<MainEmoji> findMainEmojiAll();
	
}
