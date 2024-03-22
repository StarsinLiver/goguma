package com.store.goguma.main.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BannerDTO {

	private String title;
	private String file;
	private String client;
	private String userYn;
	private Integer viewCnt;
	private Integer price;
	private String url;
	private String type;
	private String createAt;
	private String updateAt;
	
	
	
	
}
