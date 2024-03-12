package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.chat.dto.chatRoom.SaveRoomDTO;
import com.store.goguma.entity.ChatRoom;
import com.store.goguma.repository.ChatRoomRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ChatRoomService {

	@Autowired
	ChatRoomRepository chatRoomRepository;
	
	// 유저에 포함되어 있는 모든 방 찾기
	public List<ChatRoomDto> findAllByUserId(int userId) {
		return chatRoomRepository.findAllByUserId(userId);
				
	}
	
	// 채팅방 개설
	public void saveRoom(SaveRoomDTO dto) {
		
		ChatRoom chatRoom = ChatRoom.builder()
				.name(dto.getName())
				.pId(dto.getPId())
				.uId(dto.getUId())
				.hostId(dto.getHostId())
				.build();
		
		int result = chatRoomRepository.saveRoom(chatRoom);
		if(result == 0) {
			// 오류 처리
		}
	}
	
}
