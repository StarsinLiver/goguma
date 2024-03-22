package com.store.goguma.emoji.dto;

import java.util.List;

import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.MainEmoji;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class EmojiListDTO {
	
	private List<MainEmoji> MainList;
	private List<Emoji> emojiList;
}
