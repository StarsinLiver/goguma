package com.store.goguma.freeboard.dto;

import com.store.goguma.entity.FreeBoardRecommendation;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class FreeBoardRecommendationDTO {
	private Integer freeBoardId;
	private Integer uId;
	private String goodYn;
}
