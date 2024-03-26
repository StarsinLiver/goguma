package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeBoardDetailAndUserDTO {
	// 상세 조회 유저 사진, 이름 포함
	
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
	
	// user
	private String userFile;
	private String userName;
	
	public int getUid() {
		return this.uId;
	}
	
}
