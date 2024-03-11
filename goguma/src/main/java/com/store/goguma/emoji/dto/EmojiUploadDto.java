package com.store.goguma.emoji.dto;

import com.store.goguma.entity.MainEmoji;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @fileName : EmojiUploadDto.java
 * @Project : goguma
 * @Date : 2024. 3. 11.
 * @작성자 : 강민
 * @설명 : 
 */

@NoArgsConstructor
@AllArgsConstructor
@Data
public class EmojiUploadDto {

	private String name;
	private Integer price;
	private String file;
	
	public MainEmoji toEntity() {
		return MainEmoji.builder()
				.file(null)
				.name(name)
				.price(price)
				.file(file)
				.build();
	}
}
