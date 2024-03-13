package com.store.goguma.chat.dto.chatMessage;

import java.sql.Timestamp;

import com.store.goguma.utils.ChatType;

import lombok.Data;

//select c.id as messageId ,
//c.u_id as userId ,
//c.text as text ,
//c.file as file ,
//c.emoji as emoji ,
//c.room_id as roomId ,
//c.create_at as createAt ,
//c.chat_message_type as chatMessageType , 
//u.name as userName ,
//u.file as userFile
//from chat_message c 
//left join user u 
//on c.u_id = u.u_id
//where c.u_id = 1
//and u.u_id is not null;

@Data
public class ChatMessageDto {
	private Integer messageId;
	private Integer userId;
	private String text;
	private String file;
	private String emoji;
	private Integer roomId;
	private String roomName;
	private Timestamp createAt;
	private String chatMessageType;
	private String userName;
	private String userFile;
}
