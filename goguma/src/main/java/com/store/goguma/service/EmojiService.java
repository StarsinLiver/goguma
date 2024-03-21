package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.entity.Emoji;
import com.store.goguma.repository.EmojiRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class EmojiService {
	
	
	private final EmojiRepository emojiRepository;
	
	/**
	 * 모든 메인 이모지에 포함된 이모지들 가져오기
	 * @param mainEmojiList
	 * @return
	 */
	public List<Emoji> findByGroupId(List<Integer> mainEmojiList) {
		return emojiRepository.findByGroupId(mainEmojiList);
	}
	
	// 메인 이모지 update
	@Transactional
	public int updateMainEmoji(String file , String name , int price , int id) {
		return emojiRepository.updateMainEmoji(file, name, price, id);
	}
	
	// 메인 이모지 삭제
	@Transactional
	public int deleteMainEmojiById(int id) {
		return emojiRepository.deleteMainEmojiById(id);
	}
	
	// 서브 이모지 전체 삭제
	@Transactional
	public int deleteSubEmojiByGroupId(int groupId) {
		return emojiRepository.deleteSubEmojiByGroupId(groupId);
	}
	
	// 서브 이모지 insert
	@Transactional
	public int subUpload(Emoji emoji) {
		return emojiRepository.subUpload(emoji);
	}
	
	
}
