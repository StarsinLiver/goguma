package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.chat.dto.chatMessage.ChatMessageDto;
import com.store.goguma.entity.ChatMessage;

@Mapper
public interface ChatMessageRepository {

	// 모든 채팅 검색
	public List<ChatMessageDto> findAllByRoomId(int roomId);
	// 채팅 저장하기
	public int save(ChatMessage chatMessage);
	// 마지막 채팅만 보내주기
	public ChatMessageDto findByRoomId(int roomId);
	// 채팅 전체 한번에 저장하기
	public int saveAll(@Param("chatMessageList")List<ChatMessageDto> chatMessageList);
}
