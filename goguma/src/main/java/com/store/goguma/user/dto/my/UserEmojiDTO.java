package com.store.goguma.user.dto.my;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// main_emoji , Emoji_history 테이블 조인

@Data
@AllArgsConstructor
@NoArgsConstructor
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
	
	
	
	// 포메터 기능
	public String formatBalance() {
 		// 1000 --> 1,000
 		DecimalFormat df = new DecimalFormat("###,###");
 		String formaterNumber = df.format(price);
 		return formaterNumber+"원";
 	}
	
	
}
