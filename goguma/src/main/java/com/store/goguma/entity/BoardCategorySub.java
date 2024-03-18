package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardCategorySub {

	private int id;
	private String name;
	private int groupId;
	private int number;
	private int rowCount;
	private String background;
	private String font;
	private String listType;
}
