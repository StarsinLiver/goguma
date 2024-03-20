package com.store.goguma.freeboard.dto;

import java.util.List;

import com.store.goguma.user.dto.FreeBoardDto;

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
public class UserFreeBoardPageResDto {
	
	private int merchantId;
	
	private List<FreeBoardDto> dtoList;
	
    private int pg;
    private int size;
    private int total;
    
    private String search;
    private String searchType;
    private Integer mainCategory;
    private Integer subCategory;
    
    private int start, end;
    private int last;
    private boolean prev, next;
   
    
    @Builder
    public UserFreeBoardPageResDto(UserFreeBoardPageReqDto requestPageDTO,List<FreeBoardDto> dtoList, int total) {
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
