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
public class Notice {
	private Integer id;
	private String title;
	private String content;
	private Integer uId;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
}
