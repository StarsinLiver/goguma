package com.store.goguma.user.dto.my;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

// main_emoji , Emoji_history 테이블 조인

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class UserEmojiDTO {
	
	private String merchantId;
	private Integer mainEmojiId;
	private Integer price;
	private String confirmYn;
	private Integer uId;
	private Integer cancelAmount;
	private String cancelYn;
	private String cancelReason;
	private String bank;
	private String createAt;
	private String updateAt;
	
	
	// join main_emoji
	private Integer id;
	private String name;
	private String file;
	
	
	// 환불 여부
	public String cancelResult() {
		
		if(cancelYn.equals("Y")) {
			return "환불";
		}
		
		return "대기";
	}
	
	// 포메터 기능
	public String formatBalance() {
 		// 1000 --> 1,000
 		DecimalFormat df = new DecimalFormat("###,###");
 		String formaterNumber = df.format(price);
 		return formaterNumber+"원";
 	}
}