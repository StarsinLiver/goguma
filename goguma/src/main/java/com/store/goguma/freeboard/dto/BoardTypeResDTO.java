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
public class BoardTypeResDTO {

	// board_main_cate
	private int id; // pk값
	private String name; // name;
	
	// board_sub_cate
	private int subId; // pk값  * pk 값이랑 같으니까 필요가 없나?
	private String subName; // 서브 카테고리 이름
	private int groupId; // main cate와 연결되는 값 인듯?
	private int number; // 
	private int rowCount; // 노출 갯수
	private String backGround; // 배경이미지
	private String font;	// font style
	private String listType; // 리스트 형식
	
	
}
