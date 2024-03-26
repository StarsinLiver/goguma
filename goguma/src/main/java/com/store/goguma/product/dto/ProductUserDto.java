package com.store.goguma.product.dto;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductUserDto {
	private Integer pId;
	private String address;
	private String name;
	private Integer price;
	private Integer hostId;
	private String description;
	private String file;
	private Integer mainCategoryId;
	private Integer subCategoryId;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private String confirmYn;
	private Integer countChatRoom;
	private Integer countWishList;

	public int getThisPid() {
		return this.pId;
	}
	
	public String formatNumber (int number) {
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		String result = decimalFormat.format(number);
		return result;
	}
}
