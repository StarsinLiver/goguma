package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductHistory {
	private Integer id;
	private Integer pId;
	private Integer uId;
	private String confirmYn;
	private String createAt;
}
