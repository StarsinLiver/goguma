package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardTypeDTO {
	
	
	// main/sub 카테고리 join을 통해 카테고리 + 게시글 타입을 받아오기 위한 dto
	
	private Integer id; 
	private String mname; 
	private Integer subId; 
	private String name; 
	private Integer rowCount; 
	private Integer number; 
	private String backGround; 
	private String font; 
	private String listType;
}
