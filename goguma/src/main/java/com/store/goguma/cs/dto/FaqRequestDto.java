package com.store.goguma.cs.dto;

import com.store.goguma.entity.Faq;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FaqRequestDto {

	private String title;
	private String content;
	private Integer uId;
	
	public Faq toEntity() {
		return Faq.builder()
				.title(title)
				.content(content)
				.uId(uId)
				.build();
	}
}
