package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoardReviewReqDTO {
	
	@Builder.Default
    private int pg = 1;

    @Builder.Default
    private int size = 10;
    
    // 게시글 번호
    private Integer id;
}
