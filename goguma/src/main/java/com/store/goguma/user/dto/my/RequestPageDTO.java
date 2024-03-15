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
    
    // 검색 내용
    private String search;
    
    // 검색 타입
    private String searchType;
    
}
