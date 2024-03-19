package com.store.goguma.freeboard.dto;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class FreeBoardDTO {

	private int id;
	private String title;
	private String content;
	private int uid;
	private String file;
	private Timestamp createAt;
	private Timestamp updateAt;
	private Timestamp deleteAt;
	private String deleteYN;
	private String mainCategory;
	private String subCategory;
	
	
}
