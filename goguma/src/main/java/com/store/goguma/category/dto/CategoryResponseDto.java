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
public class CategoryResponseDto {

	private int index;
	private String name;
	private List<subResponseDto> subList;
	
	
	
	@NoArgsConstructor
	@AllArgsConstructor
	@Data
	public static class subResponseDto{
		private int index;
		private int mainIndex;
		private String name;
		
	}
	
}
