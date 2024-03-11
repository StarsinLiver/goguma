package com.store.goguma.entity;

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
public class ChatRoom {
	private Integer id;
	private String name;
	private Integer pId;
	private Integer uId;
	private Integer hostId;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
}
