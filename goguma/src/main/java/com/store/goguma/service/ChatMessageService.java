package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.chat.dto.chatMessage.ChatMessageDto;
import com.store.goguma.entity.ChatMessage;
import com.store.goguma.repository.ChatMessageRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatMessageService {

	@Autowired
	ChatMessageRepository chatMessageRepository;
	
	@Autowired
	SimpMessageSendingOperations messagingTemplate;
	
	
	/**
	 * 채팅방 목록 전체 가져오기
	 * @param roomId
	 * @return
	 */
	public List<ChatMessageDto> findAllByRoomId(int roomId) {
		List<ChatMessageDto> list = chatMessageRepository.findAllByRoomId(roomId);
		return list;
	}
	
	/**
	 * 저장
	 * @param chatMessage
	 * @return
	 */
	@Transactional
	public int save(ChatMessage chatMessage) {
		log.info("db 들어가기 전 확인 : " + chatMessage.toString());
		int result = chatMessageRepository.save(chatMessage);
		sendMessage(chatMessage.getRoomId());
		return result;
	}
	
	public void sendMessage(int roomId) {
		ChatMessageDto chatMessageDto = chatMessageRepository.findByRoomId(roomId);
		messagingTemplate.convertAndSend("/sub/chat/" + roomId , chatMessageDto);
	}
}
