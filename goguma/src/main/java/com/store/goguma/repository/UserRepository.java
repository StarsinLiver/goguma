package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.User;

@Mapper
public interface UserRepository {

	// u_id로 유저 조회
	public User findAllByuId(Integer uId);
}
