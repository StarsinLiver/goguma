package com.store.goguma.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmojiHistory {
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
}
