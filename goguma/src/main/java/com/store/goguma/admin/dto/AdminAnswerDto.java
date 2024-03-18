package com.store.goguma.admin.dto;

import lombok.Data;

@Data
public class AdminAnswerDto {
	private Integer adminId;
	private Integer qid;
	private String optionName;
	private String title;
	private String questionContent;
	private String answerContent;
}
