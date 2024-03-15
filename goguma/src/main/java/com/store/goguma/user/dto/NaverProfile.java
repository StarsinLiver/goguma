package com.store.goguma.user.dto;

import lombok.Data;

@Data
// res 네이버 최종 데이터 dto 
public class NaverProfile {
	private String resultcode;
    private String message;
    private NaverResponse response;
}
