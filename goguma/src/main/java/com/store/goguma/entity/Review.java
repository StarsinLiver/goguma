package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Review {
	private Integer id;
	private Integer freeBoardId;
	private Integer uId;
	private String content;
	private Integer reviewGroup;
	private Integer reviewParent;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
}
