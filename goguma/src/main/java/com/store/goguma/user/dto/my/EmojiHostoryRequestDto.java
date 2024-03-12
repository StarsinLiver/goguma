package com.store.goguma.user.dto.my;

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
public class EmojiHostoryRequestDto {
	
	@Builder.Default
    private int pg = 1;

    @Builder.Default
    private int size = 10;

    private int merchantId;
    
    
}
