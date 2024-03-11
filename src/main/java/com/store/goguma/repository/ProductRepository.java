package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.Product;

@Mapper
public interface ProductRepository {

	// 상품 조회
	public Product findAllBypId(Integer pId);


}
