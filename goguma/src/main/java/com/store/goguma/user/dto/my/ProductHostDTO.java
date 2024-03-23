package com.store.goguma.user.dto.my;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductHostDTO {
	
	private Integer prodId;
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
	
	public String formatBalance () {
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		String result = decimalFormat.format(price);
		return result;
	}
}
