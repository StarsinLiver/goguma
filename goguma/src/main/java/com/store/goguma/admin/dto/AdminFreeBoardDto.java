package com.store.goguma.admin.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class AdminFreeBoardDto {
	private Integer id;
	private String title;
	private String content;
	private Integer userId;
	private String file;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private Integer mainCategoryId;
	private String mainCategoryName;
	private String subCategoryId;
	private String subCategoryName;
	private Integer goodCount;
	private Integer viewCount;
	
	
	public String formatCreateAt() {
		return formatDate(this.createAt);
	}
	
	public String formatDate(String str) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateFormat.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dateFormat.format(date);
	}
}
