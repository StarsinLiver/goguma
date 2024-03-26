package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
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
}
