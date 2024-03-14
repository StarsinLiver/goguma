package com.store.goguma.cs.dto;

import com.store.goguma.entity.Qna;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QnaRequestDto {

	private String title;
	private String content;
	private Integer uId;
	private String optionName;
	
	public Qna toEntity() {
		return Qna.builder()
				.uId(uId)
				.title(title)
				.content(content)
				.optionName(optionName)
				.build();
	}
}
