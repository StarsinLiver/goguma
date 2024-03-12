package com.store.goguma.user.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Builder
@ToString
@Data
public class ModifyUserDto {
	
	private String email;
	private String social;
	private String name;
	private String tel;
	private String zip;
	private String addr1;
	private String addr2;
	private MultipartFile file;
}
