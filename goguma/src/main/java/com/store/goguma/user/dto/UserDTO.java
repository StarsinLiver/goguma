package com.store.goguma.user.dto;

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
public class UserDTO {
	
	private Integer uId;
    private String name;
    private String email;
    private String social;
    private String tel;
    private String address;
    private String description;
    private String zip;
    private Integer report;
    private String createAt;
    private String updateAt;
    private String deleteAt;
    private String deleteYn;
    private String role;
    private String file;
}
