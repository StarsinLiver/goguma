package com.store.goguma.user.dto;

import lombok.Data;

@Data
public class ProductHistoryReqDto {
	private Integer userId;
	private Integer hostId;
	private Integer pId;
}
