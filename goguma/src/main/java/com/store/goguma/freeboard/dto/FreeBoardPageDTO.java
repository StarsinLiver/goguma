package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FreeBoardPageDTO {
	
	@Builder.Default
    private int pg = 1;

    @Builder.Default
    private int size = 10;
	
	
}
