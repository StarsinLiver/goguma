package com.store.goguma.freeboard.dto;

import java.util.List;

import com.store.goguma.admin.dto.PageReqDTO;
import com.store.goguma.report.dto.ReportDTO;

import lombok.Builder;

public class FreeBoardListDTO {
	
	private int merchantId;
	
	private List<FreeBoardDTO> dtoList;
	
    private int pg;
    private int size;
    private int total;

    private int start, end;
    private int last;
    private boolean prev, next;
    
    @Builder
    public FreeBoardListDTO(PageReqDTO pageReqDTO,List<FreeBoardDTO> dtoList, int total) {
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
