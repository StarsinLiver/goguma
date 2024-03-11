package com.store.goguma.chat.dto.chatRoom;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatRoomDto {
	private Integer pId;
	private String productAddress;
	private String productName;
	private Integer productPrice;
	private Integer productHostId;
	private String productDescription;
	private String productFile;
	private Integer mainCategoryId;
	private Integer subCategoryId;
	private Integer roomId;
	private String roomName;
	private Integer userId;
	private Integer hostId;
	private Timestamp createAt;
}
