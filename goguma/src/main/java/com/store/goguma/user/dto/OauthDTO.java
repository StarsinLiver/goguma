package com.store.goguma.user.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Builder
@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
// 세션에 값을 남기기 위한 dto
public class OauthDTO {
	private Integer uId;
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
