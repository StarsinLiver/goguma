package com.store.goguma.entity;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeBoard {
	private Integer id;
	private String title;
	private String content;
	private Integer uId;
	private String file;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private String goodCount;
	private Integer view;
	private Integer mainCategory;
	private Integer subCategory;
	
	public String formatCreatedAt() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null ;
		try {
			date = dateFormat.parse(createAt);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return dateFormat.format(date);
	}

}
