package com.store.goguma.entity;

import java.text.DecimalFormat;

import com.store.goguma.utils.BannerType;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Banner {
	private Integer id;
	private String title;
	private String file;
	private String client;
	private String useYn;
	private Integer viewCnt;
	private Integer price;
	private BannerType type;
	private String url;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	
	public String formatNumber (int number) {
        DecimalFormat decimalFormat = new DecimalFormat("#,###");
        String formattedNumber = decimalFormat.format(number);
        return formattedNumber;
	}
}
