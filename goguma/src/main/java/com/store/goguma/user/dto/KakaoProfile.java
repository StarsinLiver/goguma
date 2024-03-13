package com.store.goguma.user.dto;



import lombok.Data;

@Data
// res 카카오 dto
public class KakaoProfile {

	private Long id;
	private String connected_at;
	private Properties properties;
	private KakaoAccount kakao_account;
	private Profile profile;
}
