package com.store.goguma.admin.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class AdminProductDto {
	private Integer pId;
	private String productName;
	private String productAddress;
	private Integer price;
	private Integer hostId;
	private String productFile;
	private String productCreateAt;
	private String productDeleteYn;
	private String confirmYn;
	private String hostName;
	private String hostEmail;
	private String hostSocial;
	private String hostTel;
	private String hostZip;
	private String hostRole;
	private String historyCreateAt;
	private Integer userId;
	private String userName;

	// 상품 등록일
	public String formatProductCreateAt() {
		return format(productCreateAt);
	}

	// 상품 거래일
	public String formatHistoryCreateAt() {
		
		return historyCreateAt == null? "" : format(historyCreateAt);
	}

	public String format(String str) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String result = null;
		try {
			Date date = dateFormat.parse(str);
			result = dateFormat.format(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}
}
