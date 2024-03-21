package com.store.goguma.user.dto;

import lombok.Data;

@Data
public class UserProfileDto {
	private Integer uId;
	private String name;
	private String email;
	private String social;
	private String tel;
	private String address;
	private String description;
	private String zip;
	private Integer report;
	private String deleteYn;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String role; // enum 타입으로 대체
	private String file;
	private Integer countProduct;
	private Integer countQna;
	private Integer countWishList;
}
