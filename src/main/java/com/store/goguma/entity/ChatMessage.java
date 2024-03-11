package com.store.goguma.entity;

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
