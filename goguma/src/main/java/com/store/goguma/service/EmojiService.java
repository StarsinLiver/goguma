package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.Emoji;
import com.store.goguma.repository.EmojiRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EmojiService {
	
	@Autowired
	EmojiRepository emojiRepository;
	
	/**
	 * 모든 메인 이모지에 포함된 이모지들 가져오기
	 * @param mainEmojiList
	 * @return
	 */
	public List<Emoji> findByGroupId(List<Integer> mainEmojiList) {
		return emojiRepository.findByGroupId(mainEmojiList);
	}
}
