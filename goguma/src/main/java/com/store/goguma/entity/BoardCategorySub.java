package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class BoardCategorySub {

	private int id;
	private int groupId;
	private String name;
	private int rowCount;
	private String background;
	private String font;
	private String listType;
	private String file;
}
