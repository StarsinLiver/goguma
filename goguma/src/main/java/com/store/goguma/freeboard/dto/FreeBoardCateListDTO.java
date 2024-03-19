package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FreeBoardCateListDTO {
	
	
	// board_main_cate
	private BoardTypeDTO boardDto;
	

	
	// free_board 테이블
	private Integer articleId; // 게시글 번호 free_board pk값 id 
	private String title;
	private String content;
	private Integer uId;
	private String file;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private String goodCount;
}
