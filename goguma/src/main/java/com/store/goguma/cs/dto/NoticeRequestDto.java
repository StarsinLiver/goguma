package com.store.goguma.cs.dto;

import com.store.goguma.entity.Notice;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class NoticeRequestDto {

	private String title;
	private String content;
	private Integer uId;
	
	public Notice toEntity() {
		return Notice.builder()
				.title(title)
				.content(content)
				.uId(uId)
				.build();
	}
}
