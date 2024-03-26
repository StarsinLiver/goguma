package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeBoardRecommendationDTO {
	private Integer freeBoardId;
	private Integer uId;
	private String goodYn;
}
