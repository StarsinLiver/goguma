package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.Product;
import com.store.goguma.product.dto.ProductSearchDto;
import com.store.goguma.product.dto.ProductUserDto;
import com.store.goguma.utils.page.PageReq;

@Mapper
public interface ProductRepository {

	// 상품 전체 조회
	public List<Product> findAllProduct();

	public List<ProductUserDto> findByHostId(Integer hostId);

	// 특정 상품 조회
	public Product findAllBypId(Integer pId);

	// 상품 전체 search 조회
	public List<ProductSearchDto> searchAll(@Param("search") String search ,@Param("searchAddress") String searchAddress , @Param("lowPrice") int lowPrice , @Param("highPrice") int highPrice , @Param("sortWishList") String sortWishList ,@Param("sortChatRoom") String sortChatRoom ,@Param("sortLowPrice") String sortLowPrice ,@Param("sortHighPrice") String sortHighPrice ,@Param("pageReq") PageReq pageReq);
	public int countSearchAll(@Param("search") String search ,@Param("searchAddress") String searchAddress , @Param("lowPrice")Integer lowPrice , @Param("highPrice") Integer highPrice);
}
