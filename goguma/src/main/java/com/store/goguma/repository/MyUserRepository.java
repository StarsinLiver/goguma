package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.user.dto.my.ProductHistoryDTO;
import com.store.goguma.user.dto.my.UserEmojiDTO;

@Mapper
public interface MyUserRepository {
	// 유저 결제 내역
	public List<UserEmojiDTO> findEmojiHistoryByUser(@Param("uId") Integer uId, @Param("start") Integer start);
	
	// 유저 결제 내역 갯수
	public int countEmojiHistoryByUser(Integer uId);
	
	// 유저 이모티콘 상세
	public UserEmojiDTO findEmojiHistoryBymerchantId(String merchantId);
	
	// 유저 이모티콘 환불
	public int updateEmojiHistoryCancel(String merchantId);
	
	
	// 구매 거래 내역
	public List<ProductHistoryDTO> myReadByproducthistory(@Param("uId") Integer uId, 
															@Param("start") Integer start);
	
	// 구매 거래 내역 갯수
	public int countProductHistoryByUser(@Param("uId") Integer uId);
}
