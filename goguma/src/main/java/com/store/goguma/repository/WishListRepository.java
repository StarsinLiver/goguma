package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.WishList;

@Mapper
public interface WishListRepository {

	public int addWishList(WishList wishList);

	public int deleteWishList(WishList WishList);

	public int findByWishList(@Param("pId") int pId, @Param("uId") int uId);

	public int countWishList(int pId);
}
