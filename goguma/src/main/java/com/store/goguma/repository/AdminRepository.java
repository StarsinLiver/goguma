package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;

import com.store.goguma.user.dto.OauthDTO;

@Mapper
public interface AdminRepository {

	void modifyAdminByEmail(OauthDTO dto);

	OauthDTO selectAdminByUid(Integer uId);

}
