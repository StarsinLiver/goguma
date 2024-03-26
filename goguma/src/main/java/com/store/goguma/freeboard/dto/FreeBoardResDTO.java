package com.store.goguma.freeboard.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class FreeBoardResDTO {
	
	// board data
	private Integer id;
	private String title;
	private Integer uId;
	private String file;
	private String createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	private String goodCount;
	

	// user data
    private String name;
    private String role;
    private String ufile;
	
    // view_count
    private int view;
    
    // good_count
    private int count;
}
