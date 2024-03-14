package com.store.goguma.chat.dto.chatRoom;

import lombok.Data;

@Data
public class ChatRoomUpdateDto {
	private Integer id;
	private Integer productId;
	private Integer userId ;
	private Integer hostId ;
	private String createAt;
	private String roomName;
	private String userExit;
	private String hostExit;
}
