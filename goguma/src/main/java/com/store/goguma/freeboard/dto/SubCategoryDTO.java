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
public class SubCategoryDTO {
	
	//필요 없을듯
	// board_sub_cate
	private Integer id;
	private String name;
	private Integer group_id;
	private Integer number;
	private Integer row_count;
	private String background;
	private String font;
	private String list_type;
	
	
}
