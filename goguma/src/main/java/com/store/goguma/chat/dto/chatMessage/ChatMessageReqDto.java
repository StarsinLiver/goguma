package com.store.goguma.chat.dto.chatMessage;

import com.store.goguma.utils.ChatType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ChatMessageReqDto {
	private Integer userId;
	private String userName;
	private String userFile;
	private String text;
	private String file;
	private String emoji;
	private Integer roomId;
	private ChatType chatMessageType;
}
