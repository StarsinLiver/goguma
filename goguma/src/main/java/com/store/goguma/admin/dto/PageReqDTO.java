package com.store.goguma.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PageReqDTO {
	@Builder.Default
    private int pg = 1;

    @Builder.Default
    private int size = 10;
    
}
