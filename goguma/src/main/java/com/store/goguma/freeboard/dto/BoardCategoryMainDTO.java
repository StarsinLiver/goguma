package com.store.goguma.freeboard.dto;

import com.store.goguma.entity.BoardCategoryMain;

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
public class BoardCategoryMainDTO {
	private int id;
	private String name;
}
