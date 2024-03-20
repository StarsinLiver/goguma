package com.store.goguma.freeboard.dto;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
public class FreeBoardListDTO {
	
	private List<?> dtoList;
	
    private int pg;
    private int size;
    private int total;

    private int start, end;
    private int last;
    private boolean prev, next;
    
    @Builder
    public FreeBoardListDTO(FreeBoardPageDTO pageReqDTO,List<?> dtoList, int total) {
        this.pg  = pageReqDTO.getPg();
        this.total  = total;
        this.size = pageReqDTO.getSize();

        this.dtoList = dtoList;

        this.end   = (int) (Math.ceil(this.pg / 10.0)) * 10;
        this.start = this.end - 9;
        this.last  = (int) (Math.ceil(total / (double) size));

        this.end  = end > last ? last : end;
        this.prev = this.start > 1;
        this.next = total > this.end * this.size;
    }
}
