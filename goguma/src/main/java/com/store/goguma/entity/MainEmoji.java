package com.store.goguma.entity;

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
