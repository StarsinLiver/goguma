package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.MainEmoji;
import com.store.goguma.repository.EmojiHistoryRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmojiHistoryService {

	@Autowired
	EmojiHistoryRepository emojiHistoryRepository;
	
	/**
	 * 유저가 구매한 모든 메인 이모지 가져오기
	 * @param userId
	 * @return
	 */
	public List<MainEmoji> findMainEmojiAllByUserId(int userId) {
		return emojiHistoryRepository.findMainEmojiAllByUserId(userId);
	}
}
