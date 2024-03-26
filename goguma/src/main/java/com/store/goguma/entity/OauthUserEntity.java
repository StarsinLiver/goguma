package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OauthUserEntity {

	private String email;
	private String name;
	private String social;
	private String tel;
	private String zip;
	private String address;
	
	// 파일처리
	private String file;
}
