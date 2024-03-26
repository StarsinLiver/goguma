package com.store.goguma.entity;

import com.store.goguma.utils.ChatType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatMessage {
	private Integer id;
	private Integer uId;
	private String text;
	private String file;
	private String emoji;
	private Integer roomId;
	private String createAt;
	private ChatType chatMessageType;
}
