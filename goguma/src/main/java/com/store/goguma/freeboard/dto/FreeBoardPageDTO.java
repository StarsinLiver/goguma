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
    
    // start값 임시 저장
    private int start = 0;
    
    // 검색 내용
    private String search;
    
    // 검색 타입
    private String searchType;
    
    // main cate1
    
    private int cate1;
    
    // cate2 id
    private int id;
 
    // listType
    private String listType;
    
}
