package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardCategorySubDTO {
	
	private int id;
	private String name;
	private int groupId;
	private int number;
	private int rowCount;
	private String background;
	private String font;
	private String listType;
}
