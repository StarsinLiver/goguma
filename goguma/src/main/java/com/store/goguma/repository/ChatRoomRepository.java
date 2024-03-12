package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;

@Mapper
public interface ChatRoomRepository {

	/**
	 * 자신이 속한 방 전체 조회
	 * @param userId
	 * @return
	 */
	public List<ChatRoomDto> findAllByUserId(int userId);
}
