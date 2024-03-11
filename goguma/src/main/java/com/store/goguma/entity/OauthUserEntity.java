package com.store.goguma.entity;

import java.security.Timestamp;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
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
