package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeBoardRecommendation {

	private Integer freeBoardId;
	private Integer uId;
	private String goodYn;
	
}
