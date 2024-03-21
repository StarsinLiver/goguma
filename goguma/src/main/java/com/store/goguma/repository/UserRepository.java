package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.User;
import com.store.goguma.user.dto.UserProfileDto;

@Mapper
public interface UserRepository {
	
	// 유저 모든 정보 조회
	public User selectByEmail(String userEmail);
	
	// 유저 정보 업데이트
	public int updateUser(User user);

	// u_id로 유저 조회
	public User findAllByuId(Integer uId);
	
	public int countUserAll();
	
	
	// 관리자 유저 정보 전체 조회
	public List<User> findAll(@Param("start") int start , @Param("name") String name);
	// 관리자 유저 정보 전체 조회 카운트
	public int countFindAll(String name);
	
	public int adminUpdateUserRole(@Param("uId") Integer uId, @Param("role") String role);
	
	public UserProfileDto findProfileById(int userId);
}
