package com.store.goguma.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.store.goguma.entity.MainEmoji;
import com.store.goguma.repository.EmojiHistoryRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class EmojiHistoryService {

	
	private final EmojiHistoryRepository emojiHistoryRepository;
	
	/**
	 * 유저가 구매한 모든 메인 이모지 가져오기
	 * @param userId
	 * @return
	 */
	public List<MainEmoji> findMainEmojiAllByUserId(int userId) {
		return emojiHistoryRepository.findMainEmojiAllByUserId(userId);
	}

	// admin 모든 이모지 출력
	public List<MainEmoji> findMainEmojiAll() {
		// TODO Auto-generated method stub
		return emojiHistoryRepository.findMainEmojiAll();
	}
	
	// 이모지를 사용하고 있는 유저들의 카운트
	public int countByMainEmojiId(int groupId) {
		return emojiHistoryRepository.countByMainEmojiId(groupId);
	}
	
	
	// 이모지를 가지고 있는지 유효성 검사
	public int countByUserId(int userId , int mainEmojiId) {
		return emojiHistoryRepository.countByUserId(userId , mainEmojiId);
	}
}
