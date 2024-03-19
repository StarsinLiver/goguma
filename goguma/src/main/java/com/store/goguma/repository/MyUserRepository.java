package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.Product;
import com.store.goguma.user.dto.my.ProductHistoryDTO;
import com.store.goguma.user.dto.my.ProductHostDTO;
import com.store.goguma.user.dto.my.QnaUserDTO;
import com.store.goguma.user.dto.my.UserEmojiDTO;
import com.store.goguma.user.dto.my.WishProductDTO;

@Mapper
public interface MyUserRepository {
	// 유저 결제 내역
	public List<UserEmojiDTO> findEmojiHistoryByUser(@Param("uId") Integer uId, @Param("start") Integer start);
	
	// 유저 결제 내역 갯수
	public int countEmojiHistoryByUser(Integer uId);
	
	// 유저 이모티콘 상세
	public UserEmojiDTO findEmojiHistoryBymerchantId(String merchantId);
	
	// 유저 이모티콘 환불
	public int updateEmojiHistoryCancel(@Param("merchantId") String merchantId, 
										@Param("uId") Integer uId,
										@Param("reason") String reason);
	
	
	// 구매 거래 내역
	public List<ProductHistoryDTO> myReadByproducthistory(@Param("uId") Integer uId, 
															@Param("start") Integer start);
	
	// 구매 거래 내역 갯수
	public int countProductHistoryByUser(Integer uId);
	
	// 유저 상품 목록
	public List<ProductHostDTO> selectProductHostByUid(@Param("uId") Integer uId, 
												@Param("start") Integer start); 
	
	// 유저 상품 목록 갯수
	public int countProductHostByUid(Integer uId);
	
	// 내 문의하기 내역
	public List<QnaUserDTO> findQnaByUid(@Param("uId") Integer uId, 
										@Param("start") Integer start,
										@Param("search")String search, 
										@Param("searchType")String searchType);
	
	// 문의 내역 갯수
	public int countQnaByUid(@Param("uId") Integer uId, 
							@Param("search")String search, 
							@Param("searchType")String searchType);
	
	// 문의내역 삭제
	public int updateDeleteByQnaId(Integer id);
	
	// 이모티콘 목록 조회
	public List<UserEmojiDTO> selectAllImoji(@Param("uId") Integer uId, 
			@Param("start") Integer start);
	
	// 이모티콘 갯수
	public int countImoji(Integer uId);
	
	// 찜 목록
	public List<WishProductDTO> selectWishListByUid(@Param("uId") Integer uId, 
			@Param("start") Integer start);
	
	// 찜 갯수
	public int countWishListByUid(Integer uId);
}
