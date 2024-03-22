package com.store.goguma.freeboard.dto;

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
	private Integer view;
	private String goodCount;
	private Integer mainCategory;
	private Integer subCategory;
	private Integer totalPosts;
	private String userName;
	private String userFile;
	
	public int getUid() {
		return this.uId;
	}
}
