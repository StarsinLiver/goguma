package com.store.goguma.freeboard.dto;

import java.security.Timestamp;

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
public class FreeBoardDTO {
	private Integer id;
	private String title;
	private String content;
	private Integer uId;
	private String file;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private String goodCount;
	private Integer mainCategory;
	private Integer subCategory;
	private Integer totalPosts;
	
	public int getUid() {
		return this.uId;
	}
}
