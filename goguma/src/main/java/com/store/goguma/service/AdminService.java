package com.store.goguma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.repository.AdminRepository;
import com.store.goguma.user.dto.OauthDTO;

@Service
public class AdminService {

	@Autowired
	private AdminRepository repository;
	
	// adminUser 업데이트 
	public void modifyAdminByEmail(OauthDTO dto) {
		
		repository.modifyAdminByEmail(dto);
	}

	// adminUser Uid로 select 
	public OauthDTO selectAdminByUid(Integer uId) {
	
		return repository.selectAdminByUid(uId);
		
		
	}

	
	
	
}
