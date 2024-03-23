package com.store.goguma.chat.dto.chatRoom;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
	private String confirmYn;
	private Integer roomId;
	private String roomName;
	private Integer userId;
	private Integer hostId;
	private String hostName;
	private String hostFile;
	private String userName;
	private String userFile;
	private Timestamp createAt;
	
	
	public Integer getPid() {
		return this.pId;
	}
	
	public String formatCreateAt() {
		
		// Timestamp를 LocalDateTime으로 변환
        LocalDateTime localDateTime = createAt.toLocalDateTime();

        // 변환된 LocalDateTime을 원하는 형식의 문자열로 포맷팅
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDateTime = localDateTime.format(formatter);

        // 포맷팅된 문자열 출력
       return formattedDateTime;
	}
}
