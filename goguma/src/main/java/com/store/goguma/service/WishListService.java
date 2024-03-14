package com.store.goguma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.WishList;
import com.store.goguma.product.dto.WishListDTO;
import com.store.goguma.repository.WishListRepository;

import lombok.extern.slf4j.Slf4j;

@Service
public class WishListService {

    @Autowired
    private WishListRepository wishListRepository;

    // 찜 추가
    public void addWishList(WishListDTO dto) {
    	
        WishList wishList = WishList.builder()
        		.pId(dto.getPId())
        		.uId(dto.getUId())
        		.build();
        
        wishListRepository.addWishList(wishList);
    }
    
    // 찜 삭제
    public void deleteWishList(WishListDTO dto) {
    	
        WishList wishList = WishList.builder()
        		.pId(dto.getPId())
        		.uId(dto.getUId())
        		.build();
        
        wishListRepository.deleteWishList(wishList);
    }
    
    // 상품이 찜 목록에 있는지 확인
    public boolean prodWishlist(int uId, int pId) {
        int count = wishListRepository.findByWishList(pId, uId);

        return count > 0;
    }
}