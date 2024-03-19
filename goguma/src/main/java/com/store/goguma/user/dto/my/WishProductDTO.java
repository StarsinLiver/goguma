package com.store.goguma.user.dto.my;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 찜 목록
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class WishProductDTO {
	
	private Integer id;
	private Integer productId;
	private Integer uId;
	private String createAt;
	
	
	// product 테이블
	private String address;
    private String name;
    private Integer price;
    private String productFile;
    
 // 포메터 기능
  	public String formatBalance() {
  		// 1000 --> 1,000
  		DecimalFormat df = new DecimalFormat("###,###");
  		String formaterNumber = df.format(price);
  		return formaterNumber+"원";
  	}
}
