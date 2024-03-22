package com.store.goguma.freeboard.dto;

import lombok.Data;

@Data
public class FreeBoardDetailDto {
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
	private Integer view;
	private Integer mainCategory;
	private Integer subCategory;
	private String userName;
	private String userFile;
}
