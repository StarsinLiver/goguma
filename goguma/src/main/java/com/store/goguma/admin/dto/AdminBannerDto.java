package com.store.goguma.admin.dto;

import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.utils.BannerType;

import lombok.Data;

@Data
public class AdminBannerDto {
	private Integer id;
	private String title;
	private MultipartFile file;
	private String client;
	private String useYn;
	private Integer viewCtn;
	private Integer price;
	private BannerType type;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
}
