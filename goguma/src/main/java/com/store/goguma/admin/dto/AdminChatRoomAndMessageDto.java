package com.store.goguma.admin.dto;

import java.util.List;

import com.store.goguma.chat.dto.chatMessage.ChatMessageDto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AdminChatRoomAndMessageDto {
	private AdminChatRoomDto adminChatRoomDto;
	private List<ChatMessageDto> chatMessageDto;
}
