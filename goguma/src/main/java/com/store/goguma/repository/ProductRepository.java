package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.admin.dto.AdminProductDto;
import com.store.goguma.entity.Product;
import com.store.goguma.product.dto.ProductSearchDto;
import com.store.goguma.product.dto.ProductUserDto;
import com.store.goguma.utils.page.PageReq;

@Mapper
public interface ProductRepository {

	// 상품 전체 조회
	public List<Product> findAllProduct();

	// public List<Product> findByHostId(Integer hostId);
	public List<Product> findWishAndChat(Integer pId);

	public List<ProductUserDto> findByHostId(Integer hostId);

	// 특정 상품 조회
	public Product findAllBypId(Integer pId);

	// 상품 전체 search 조회
	public List<ProductSearchDto> searchAll(@Param("search") String search ,@Param("searchAddress") String searchAddress , @Param("lowPrice") int lowPrice , @Param("highPrice") int highPrice , @Param("sortWishList") String sortWishList ,@Param("sortChatRoom") String sortChatRoom ,@Param("sortLowPrice") String sortLowPrice ,@Param("sortHighPrice") String sortHighPrice ,@Param("pageReq") PageReq pageReq);
	public int countSearchAll(@Param("search") String search ,@Param("searchAddress") String searchAddress , @Param("lowPrice")Integer lowPrice , @Param("highPrice") Integer highPrice);
	
	// 메인 상품
	public List<ProductSearchDto> findLimitEightFromMain();
	// 전체 상품 갯수
	public int countProductAll();
	
	// 관리자 계정에서 전체 보기
	public List<AdminProductDto> adminFindAll(@Param("start")int start , @Param("search") String search , @Param("searchType") String searchType);
	// 관리자 계정 전체 보기 카운트
	public int adminCountFindAll(@Param("search") String search , @Param("searchType") String searchType);
	// 관리자 계쩡으로 상품 삭제
	public int adminDeleteProduct(int pId);
	
	// 상품 등록
	public int insertProduct(Product product);
	
	// 상품 거래 완료
	public int updateConfirmYn(int pId);
}
