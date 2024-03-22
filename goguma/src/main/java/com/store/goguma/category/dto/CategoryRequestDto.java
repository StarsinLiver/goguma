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

	private int index;
	private String name;
	private List<sub1> subList;
	
	public BoardCategoryMain toEntity() {
		return BoardCategoryMain.builder()
				.mainIndex(index)
				.name(name)
				.build();
	}
	
	@NoArgsConstructor
	@AllArgsConstructor
	@Data
	public static class sub1{
		private int index;
		private int mainIndex;
		private String name;
		
		public BoardCategorySub toEntity() {
			return BoardCategorySub.builder()
					.groupId(mainIndex)
					.name(name)
					.build();
		}
	}
	
}
