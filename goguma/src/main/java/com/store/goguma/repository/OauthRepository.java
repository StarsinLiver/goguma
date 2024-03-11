package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.entity.OauthUserEntity;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.OauthResisterDTO;
import com.store.goguma.user.dto.ResOauthUserDTO;

@Mapper
public interface OauthRepository {

	public OauthDTO readUserByUserEmail(String userEmail);

	public int insert(OauthUserEntity userEntity);
	
	
}
