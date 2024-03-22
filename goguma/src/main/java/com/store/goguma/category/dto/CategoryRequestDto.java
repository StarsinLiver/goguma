package com.store.goguma.category.dto;

import java.util.List;

import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.BoardCategorySub;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CategoryRequestDto {

	private int id;
	private String name;
	private int flag;
	private List<SubCateObject> subList;
	
	public BoardCategoryMain toEntity() {
		return BoardCategoryMain.builder()
				.id(id)
				.name(name)
				.build();
	}
	
	@NoArgsConstructor
	@AllArgsConstructor
	@Data
	public static class SubCateObject{
		private int id;
		private int groupId;
		private String name;
		private String font;
		private String listType;
		private int flag;
		
		public BoardCategorySub toEntity() {
			return BoardCategorySub.builder()
					.id(id)
					.groupId(groupId)
					.name(name)
					.font("")
					.background("")
					.file("")
					.listType("")
					.build();
		}
	}
	
}
