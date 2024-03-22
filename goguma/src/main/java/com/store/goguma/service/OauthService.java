package com.store.goguma.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.entity.OauthUserEntity;
import com.store.goguma.entity.User;
import com.store.goguma.repository.OauthRepository;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.OauthResisterDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@RequiredArgsConstructor
public class OauthService {

	
	private final OauthRepository oauthRepository;

	public OauthDTO readUserByUserEmail(String email, String oauth) {

		String userEmail = oauth + email;

		log.info("서비스 유저 이메일 합쳐진것 확인!!!!!!!!@!!" + userEmail);

		OauthDTO dto = oauthRepository.readUserByUserEmail(userEmail);

		log.info("####################### " + dto);

		return dto;
	}
	@Transactional
	public int createUser(OauthResisterDTO dto) {

		OauthUserEntity userEntity = OauthUserEntity.builder().email(dto.getEmail()).name(dto.getName())
				.social(dto.getSocial()).tel(dto.getTel()).address(dto.getAddress()).zip(dto.getZip())
				.file(dto.getFile()).build();

		int result = oauthRepository.insert(userEntity);

		if (result != 1) {
			// throw new CustomRestfulException("회원가입 실패",
			// HttpStatus.INTERNAL_SERVER_ERROR);
			log.info(dto);
		}

		return result;
	}

	public User findByUserId(int userId) {
		User user = oauthRepository.findByUserId(userId);

		if (user == null) {
			// 오류 처리
		}
		return user;
	}

	public OauthDTO checkDeleteUser(String email) {
		// TODO Auto-generated method stub
		return null;
	}
}
