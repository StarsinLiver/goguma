package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.Product;

@Mapper
public interface ProductRepository {

	// 상품 전체 조회
	public List<Product> findAllProduct();
	public List<Product> findByHostId(Integer hostId);
	// 특정 상품 조회
	public Product findAllBypId(Integer pId);


}
