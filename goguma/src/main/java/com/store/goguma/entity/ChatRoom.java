package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChatRoom {
	private Integer id;
	private Integer pId;
	private Integer uId;
	private Integer hostId;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private String userExit;
	private String hostExit;
}
