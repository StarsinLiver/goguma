package com.store.goguma.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.chat.dto.chatRoom.ChatRoomUpdateDto;
import com.store.goguma.chat.dto.chatRoom.SaveRoomDTO;
import com.store.goguma.entity.ChatRoom;
import com.store.goguma.handler.exception.BackPageRestfulException;
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
    public int saveRoom(SaveRoomDTO dto) {

        ChatRoom chatRoom = ChatRoom.builder()
                .pId(dto.getPId())
                .uId(dto.getUId())
                .hostId(dto.getHostId())
                .build();

        int result = chatRoomRepository.saveRoom(chatRoom);
        if(result == 0) {
            // 오류 처리
        }
        return chatRoom.getId();
    }

	// 해당 방의 방 이름을 찾기
	public ChatRoomUpdateDto findByRoomId(int roomId , int userId) {
		ChatRoomUpdateDto chatRoomUpdateDto = chatRoomRepository.findByRoomId(roomId, userId);
		if(chatRoomUpdateDto == null) {
			throw new BackPageRestfulException("해당 방을 찾을 수가 없습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return chatRoomUpdateDto;
	}
	
	// 채팅방의 user 방 나가기
	@Transactional
	public int updateUserExit(int roomId) {
		return chatRoomRepository.updateUserExit(roomId);
	}
	
	// 채팅방의 host 방 나가기
	@Transactional
	public int updateHostExit(int roomId) {
		return chatRoomRepository.updateHostExit(roomId);
	}

	// 채팅 중복 조회
	public int isExistChatRoom(int pId, int uId) {
		return chatRoomRepository.isExistChatRoom(pId, uId);
	}
	
	public int countChatRoomAll() {
		return chatRoomRepository.countChatRoomAll();
	}
}
