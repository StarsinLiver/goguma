package com.store.goguma.freeboard.dto;

import lombok.Data;

@Data
public class FreeBoardCountRecommendationByCateDto {
	private Integer id;
	private String title;
	private Integer userId;
	private String file;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private Integer mainCateogryId;
	private Integer subCategoryId;
	private String mainCategoryName;
	private String subCategoryName;
	private Integer goodCount;
	private Integer view;
}
