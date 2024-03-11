package com.store.goguma.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OauthResisterDTO {
	
	private String email;
	private String name;
	private String social;
	private String tel;
	private String zip;
	private String addr1;
	private String addr2;
	
	
	
	//addr1 + addr2 합친 주소
	private String address;
	
	// 파일처리
	private String file;
	
	
	
}
