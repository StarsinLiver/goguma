package com.store.goguma.user.dto.my;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ResponsePageDTO {
	
	private int merchantId;
	
	private List<?> dtoList;
	
    private int pg;
    private int size;
    private int total;
    
    private String search;
    private String searchType;

    private int start, end;
    private int last;
    private boolean prev, next;
    
    @Builder
    public ResponsePageDTO(RequestPageDTO requestPageDTO,List<?> dtoList, int total) {
        this.pg  = requestPageDTO.getPg();
        this.total  = total;
        this.size = requestPageDTO.getSize();

        this.dtoList = dtoList;
        
        this.search = requestPageDTO.getSearch();
        this.searchType = requestPageDTO.getSearchType();

        this.end   = (int) (Math.ceil(this.pg / 10.0)) * 10;
        this.start = this.end - 9;
        this.last  = (int) (Math.ceil(total / (double) size));

        this.end  = end > last ? last : end;
        this.prev = this.start > 1;
        this.next = total > this.end * this.size;
    }
	
}
