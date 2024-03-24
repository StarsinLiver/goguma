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
public class CategoryDTO {

	//메인 카테고리
	
	private Integer id;
	private String name;
	
	// board_sub_cate
	private Integer subId;
	private String subName;
	private Integer groupId;
	private Integer rowCount;
}
