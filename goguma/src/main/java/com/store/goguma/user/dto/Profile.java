package com.store.goguma.user.dto;


import lombok.Data;

@Data
// 카카오에서 들어오는 데이터 중 profile 객체 데이터
public class Profile {

	private String nickname;
	private String thumbnail_Image_Url;
	private String profile_Image_Url;
	private Boolean is_Default_Image;
	private String email;


}
