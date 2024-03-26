package com.store.goguma.utils.page;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
//@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class PageReq {

	/** 현재 페이지 번호 : page == number */
	private int page;

	/** 페이지당 출력할 데이터 개수 */
	private int size;
	
	/** 페이징시 */
	private int cal;

//	offset 개수 : 1st 데이터로 부터 얼마나 떨어져 있는지 개수
//	private Integer offset = page * size;

	public PageReq(int page, int size) {
		this.page = page;
		this.size = size;
		this.cal = page * size;
	}
}