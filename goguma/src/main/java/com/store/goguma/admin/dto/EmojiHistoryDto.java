package com.store.goguma.admin.dto;

import lombok.Data;

@Data
public class EmojiHistoryDto {
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
	private String mainEmojiName;
}
