package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.entity.User;

@Mapper
public interface UserRepository {
	
	// 유저 모든 정보 조회
	public User selectByEmail(String userEmail);
	
	// 유저 정보 업데이트
	public int updateUser(User user);
}
