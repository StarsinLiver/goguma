package com.store.goguma.user.dto;



import lombok.Data;

@Data
// 카카오에서 들어오는 데이터를 받기 위한 dto
public class KakaoProfile {

	private Long id;
	private String connected_at;
	private Properties properties;
	private KakaoAccount kakao_account;
	private Profile profile;
}
