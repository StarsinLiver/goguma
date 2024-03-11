package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
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
	private String report;
	private String delete_yn;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String role; // enum 타입으로 대체
	private String file;
}
