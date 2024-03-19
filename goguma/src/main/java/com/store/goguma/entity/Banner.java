package com.store.goguma.entity;

import com.store.goguma.utils.BannerType;

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
public class Banner {
	private Integer id;
	private String title;
	private String file;
	private String client;
	private String useYn;
	private Integer viewCtn;
	private Integer price;
	private BannerType type;
	private String url;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
}
