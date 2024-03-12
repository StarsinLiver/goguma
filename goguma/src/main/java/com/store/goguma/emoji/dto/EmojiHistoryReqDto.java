package com.store.goguma.emoji.dto;

import com.store.goguma.entity.EmojiHistory;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class EmojiHistoryReqDto {

	private String merchantId;
	private Integer mainEmojiId;
	private Integer price;
	private Integer uId;
	private Integer cancelAmount;
	private String cancelYn;
	private String cancelReason;
	private String bank;
	
	// 이모티콘 구매
	public EmojiHistory toEntity() {
		return EmojiHistory.builder()
				.merchantId(merchantId)
				.mainEmojiId(mainEmojiId)
				.price(price)
				.uId(uId)
				.bank(bank)
				.build();
	}
}
