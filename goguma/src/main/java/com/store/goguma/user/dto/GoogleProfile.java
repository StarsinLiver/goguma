package com.store.goguma.user.dto;

import lombok.Data;

@Data
// 구글 최종 dto
public class GoogleProfile {

	private String id;
	private String name;
	private String givenName;
	private String familyName;
	private String picture;
	private String locale;
	private String email;
}
