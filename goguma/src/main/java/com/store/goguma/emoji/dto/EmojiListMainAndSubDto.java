package com.store.goguma.emoji.dto;

import java.util.List;

import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.MainEmoji;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class EmojiListMainAndSubDto {
	private MainEmoji mainEmoji;
	private List<Emoji> subEmoji;
}
