package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.chat.dto.ChatUtil;
import com.store.goguma.chat.dto.chatMessage.ChatMessageDto;
import com.store.goguma.entity.ChatMessage;
import com.store.goguma.repository.ChatMessageRepository;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatMessageService {

	@Autowired
	ChatMessageRepository chatMessageRepository;
	
	@Autowired
	SimpMessageSendingOperations messagingTemplate;
	
	@Autowired
	HttpSession httpSession;
	
	
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
	
	// 메시지 여러장 보낼 때
//	public void sendMessageAll(int roomId) {
//		List<ChatMessageDto> list = findAllByRoomId(roomId);
//		messagingTemplate.convertAndSend("/sub/chat/" + roomId , list);
//	}
	
	
	// 메시지 마지막 하나만 보낼 때
	public void sendMessage(int roomId) {
		// 보낼 메시지
		ChatMessageDto chatMessageDto = chatMessageRepository.findByRoomId(roomId);
		
		messagingTemplate.convertAndSend("/sub/chat/" + roomId , chatMessageDto);
	}
}
