package com.store.goguma.user.dto;


import lombok.Data;

@Data
public class Profile {

	private String nickname;
	private String thumbnail_Image_Url;
	private String profile_Image_Url;
	private Boolean is_Default_Image;
	private String email;


}
