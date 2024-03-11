package com.store.goguma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.OauthUserEntity;
import com.store.goguma.repository.OauthRepository;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.OauthResisterDTO;
import com.store.goguma.user.dto.ResOauthUserDTO;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class OauthService {

	@Autowired
	private OauthRepository oauthRepository;
	
	public OauthDTO readUserByUserEmail(String email, String oauth) {
		
		String userEmail = oauth + email ;
		
		log.info("서비스 유저 이메일 합쳐진것 확인!!!!!!!!@!!"+ userEmail);
		
		return oauthRepository.readUserByUserEmail(userEmail);
}

	public void createUser(OauthResisterDTO dto) {

		OauthUserEntity userEntity = OauthUserEntity.builder()
									.email(dto.getEmail())
									.name(dto.getName())
									.social(dto.getSocial())
									.tel(dto.getTel())
									.address(dto.getAddress())
									.zip(dto.getZip())
									.file(dto.getFile())
									.build();
		
		int result = oauthRepository.insert(userEntity);
		
		if (result != 1) {
			//throw new CustomRestfulException("회원가입 실패", HttpStatus.INTERNAL_SERVER_ERROR);
			log.info(dto);
		}
		
		
		
	}
	
	
	
	
}
