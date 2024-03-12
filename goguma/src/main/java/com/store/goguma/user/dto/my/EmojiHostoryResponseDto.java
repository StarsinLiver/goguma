package com.store.goguma.user.dto.my;

import java.util.List;

import com.store.goguma.entity.EmojiHistory;

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
public class EmojiHostoryResponseDto {
	
	private int merchantId;
	
	private List<EmojiHistory> emojiHistoryList;
	
    private int pg;
    private int size;
    private int total;

    private int start, end;
    private int last;
    private boolean prev, next;
    
    @Builder
    public EmojiHostoryResponseDto(EmojiHostoryRequestDto csPageRequestDTO, List<EmojiHistory> emojiHistoryList, int total, int cno) {
        this.pg  = csPageRequestDTO.getPg();
        this.total  = total;
        this.size = csPageRequestDTO.getSize();

        this.emojiHistoryList = emojiHistoryList;

        this.end   = (int) (Math.ceil(this.pg / 10.0)) * 10;
        this.start = this.end - 9;
        this.last  = (int) (Math.ceil(total / (double) size));

        this.end  = end > last ? last : end;
        this.prev = this.start > 1;
        this.next = total > this.end * this.size;
    }
	
}
