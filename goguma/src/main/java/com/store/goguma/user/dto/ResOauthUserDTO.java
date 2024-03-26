package com.store.goguma.user.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
//  oauthDTO용 TODO 제거 할지 봐야함 현재 보류
public class ResOauthUserDTO {

	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private Timestamp createdAt;
	private String originFileName;
	private String uploadFileName;
	
}
