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
public class FreeBoardReviewDTO {
	
	private Integer id;
	private Integer freeBoardId;
	private Integer uId;
	private String content;
	private Integer reviewGroup;
	private Integer reviewParent;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private String file; // 이모티콘
	
	// user
	private String userName;
	private String userFile;
}
