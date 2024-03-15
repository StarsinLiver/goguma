package com.store.goguma.user.dto;

import lombok.Data;

@Data
// res 네이버 dto
public class NaverResponse {
	private String id;
	private String nickname;
	private String profileImage;
	private String email;
	private String name;
}
