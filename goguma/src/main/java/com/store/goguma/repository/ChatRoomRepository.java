package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.entity.ChatRoom;

@Mapper
public interface ChatRoomRepository {

	/**
	 * 자신이 속한 방 전체 조회
	 * @param userId
	 * @return
	 */
	public List<ChatRoomDto> findAllByUserId(int userId);
	
	// 채팅방 생성
	public int saveRoom(ChatRoom chatRoom);
	
}
