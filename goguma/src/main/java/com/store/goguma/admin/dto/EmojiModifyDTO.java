package com.store.goguma.admin.dto;

import com.store.goguma.entity.MainEmoji;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Builder
public class EmojiModifyDTO {

	private String name;
	private int price;
	private String file;
	private int id;
	private int groupId;
	
	public MainEmoji toEntity() {
		return MainEmoji.builder()
				.file(null)
				.name(name)
				.price(price)
				.file(file)
				.build();
	}
}
