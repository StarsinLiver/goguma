package com.store.goguma.user.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Data;

// json형식에 코딩 컨벤션의 스네이크 케이스를 카멜 노이션으로 변경 하기
@JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
@Data
public class OAuthToken {

    private String accessToken;
    private String tokenType;
    private String refreshToken;
    private String scope;
    private String expiresIn;
    private String refreshTokenExpiresIn;

}