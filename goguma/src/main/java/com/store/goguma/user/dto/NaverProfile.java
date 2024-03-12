package com.store.goguma.user.dto;

import lombok.Data;

@Data
public class NaverProfile {
	private String resultcode;
    private String message;
    private NaverResponse response;
}
