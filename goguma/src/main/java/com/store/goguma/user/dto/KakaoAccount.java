package com.store.goguma.user.dto;


import lombok.Data;

@Data
// res 카카오 oauth 1차 데이터 
public class KakaoAccount {

    private Boolean profileNicknameNeedsAgreement;
    private Boolean profileImageNeedsAgreement;
    private Profile profile;
    private String email;
    
}
