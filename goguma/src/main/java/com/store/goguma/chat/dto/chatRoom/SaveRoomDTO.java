package com.store.goguma.chat.dto.chatRoom;

import lombok.Data;

@Data
public class SaveRoomDTO {
	
	private String name;
	private Integer pId;
	private Integer uId;
	private Integer hostId;
}
