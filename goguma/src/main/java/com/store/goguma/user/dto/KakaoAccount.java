package com.store.goguma.user.dto;


import lombok.Data;

@Data
public class KakaoAccount {

    private Boolean profileNicknameNeedsAgreement;
    private Boolean profileImageNeedsAgreement;
    private Profile profile;
    private String email;
    
}
