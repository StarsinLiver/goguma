package com.store.goguma.user.dto.my;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//중고거래 내역(구매자)
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductHistoryDTO {
	
	// ProductHistory 테이블
    private Integer id;
    private Integer prodId;
    private Integer uId;
    private String confirmYn;
    private String createAt;
    
    // Product 테이블
    private String  productAddress;
    private Integer productHostId;
    private Integer productMainCategoryId;
    private Integer productSubCategoryId;
    private String prodName;
    private Integer productPrice;
    private String productFile;
    private String productConfirmYn;
    
    // User 테이블
    private String userName; // name 컬럼을 위한 별칭
	
    
    // 포메터 기능
 	public String formatBalance() {
 		// 1000 --> 1,000
 		DecimalFormat df = new DecimalFormat("###,###");
 		String formaterNumber = df.format(productPrice);
 		return formaterNumber+"원";
 	}
 	
}
