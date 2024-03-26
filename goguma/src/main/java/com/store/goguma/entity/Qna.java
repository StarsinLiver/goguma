package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Qna {
	private Integer id;
	private String title;
	private String content;
	private Integer uId;
	private Integer adminid;
	private String answerContent;
	private String answerYn;
	private String optionName;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
}
