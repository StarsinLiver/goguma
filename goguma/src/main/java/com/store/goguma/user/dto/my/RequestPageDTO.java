package com.store.goguma.user.dto.my;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RequestPageDTO {
	
	@Builder.Default
    private int pg = 1;

    @Builder.Default
    private int size = 10;
    
}
