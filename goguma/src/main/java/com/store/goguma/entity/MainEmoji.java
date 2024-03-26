package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MainEmoji {
	private Integer id;
	private String file;
	private String name;
	private Integer price;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private int downloadCount;
	
	
}
