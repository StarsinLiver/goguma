package com.store.goguma.user.dto.my;

import java.sql.Timestamp;

import com.store.goguma.utils.Utils;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 유저 문의하기 내역
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QnaUserDTO {

	private Integer id;
	private String title;
	private String content;
	private Integer uId;
	private Integer adminid;
	private String answerContent;
	private String answerYn;
	private String optionName;
	private Timestamp createAt;
	private String updateAt;
	private String deleteAt;
	private String deleteYn;
	
	// 회원 이름
	private String userName;
	
	// 관리자 이름
	private String adminName;
	
	public String formatCreatedAt() {
		return Utils.timestampToString(createAt);
	}
}
