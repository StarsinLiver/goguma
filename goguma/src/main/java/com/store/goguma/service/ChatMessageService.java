package com.store.goguma.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.chat.dto.chatMessage.ChatMessageDto;
import com.store.goguma.entity.ChatMessage;
import com.store.goguma.repository.ChatMessageRepository;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ChatMessageService {


	private final ChatMessageRepository chatMessageRepository;

	
	private final SimpMessageSendingOperations messagingTemplate;

	
	private final HttpSession httpSession;

	List<ChatMessageDto> message = new ArrayList<>();

	final int SIZE = 10;

	/**
	 * 채팅방 목록 전체 가져오기
	 * 
	 * @param roomId
	 * @return
	 */
	public List<ChatMessageDto> findAllByRoomId(int roomId) {
		List<ChatMessageDto> list = chatMessageRepository.findAllByRoomId(roomId);

		// 리스트와 함께 보내기
		for (ChatMessageDto dto : message) {
			if (dto.getRoomId() == roomId) {
				list.add(dto);
			}
		}

		return list;
	}
	

	/**
	 * 저장
	 * 
	 * @param chatMessage
	 * @return
	 */
	@Transactional
	public boolean save(ChatMessage chatMessage, OauthDTO user) {
		
		boolean isTrue = false;
		
		ChatMessageDto chatMessageDto = new ChatMessageDto();
		try {
			chatMessageDto.setUserId(user.getUId());
			chatMessageDto.setText(chatMessage.getText());
			chatMessageDto.setFile(chatMessage.getFile());
			chatMessageDto.setEmoji(chatMessage.getEmoji());
			chatMessageDto.setRoomId(chatMessage.getRoomId());
			chatMessageDto.setCreateAt(convertToTimestamp(new Date()));
			chatMessageDto.setChatMessageType(chatMessage.getChatMessageType().toString());
			chatMessageDto.setUserName(user.getName());
			chatMessageDto.setUserFile(user.getFile());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 만약 메시지 사이즈가 10보다 작을 때
		if (message.size() < SIZE) {
			message.add(chatMessageDto);
		}
		
		// SIZE 가 10 이라면
		if (message.size() == SIZE) {
			isTrue = saveAll(message);
			message.clear();
		}
		
		
		sendMessage(chatMessageDto);
		return isTrue;
	}

	// 메시지 마지막 하나만 보낼 때 ( 바로 )
	public void sendMessage(ChatMessageDto chatMessageDto) {
		log.info("메시지 list 사이즈 : {}" , message.size());
		messagingTemplate.convertAndSend("/sub/chat/" + chatMessageDto.getRoomId(), chatMessageDto);
	}

	// 메시지 마지막 하나만 보낼 때 ( 데이터 조회 )
//	public void sendMessage(int roomId) {
//		// 보낼 메시지
//		ChatMessageDto chatMessageDto = chatMessageRepository.findByRoomId(roomId);
//
//		messagingTemplate.convertAndSend("/sub/chat/" + roomId, chatMessageDto);
//	}

	// Date to Timestamp
	public Timestamp convertToTimestamp(Date date) throws ParseException {
		return new Timestamp(date.getTime()); // Date를 Timestamp로 변환하여 반환합니다.
	}
	
	// 전체 저장
	@Transactional
	public boolean saveAll(List<ChatMessageDto> chatMessageDto) {
		int result = chatMessageRepository.saveAll(message);
		if(result == 0) {
			return false;
		}
		return true;
	}
}
