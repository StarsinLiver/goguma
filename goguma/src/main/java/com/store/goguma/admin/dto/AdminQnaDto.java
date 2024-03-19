package com.store.goguma.admin.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class AdminQnaDto {
	private Integer id;
	private String questionTitle;
	private String questionContent;
	private Integer userId;
	private Integer adminId;
	private String answerContent;
	private String answerYn;
	private String optionName;
	private String createAt;
	private String deleteAt;
	private String deleteYn;
	private String userName;

	/**
	 * 생성 일자 포맷
	 * @return
	 */
	public String formatDate() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = "";
		try {
			Date date = dateFormat.parse(createAt);
			strDate = dateFormat.format(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return strDate;
	}
}
