package com.store.goguma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.goguma.entity.User;
import com.store.goguma.repository.UserRepository;
import com.store.goguma.user.dto.UserDTO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserService {
	
	@Autowired
	UserRepository userRepository;
	
	// u_id로 유저 조회
	public UserDTO findAllByuId(Integer uId) {
		
		User user = userRepository.findAllByuId(uId);
		
		UserDTO dto = UserDTO.builder()
			.uId(user.getUId())
			.name(user.getName())
			.email(user.getEmail())
			.social(user.getSocial())
			.tel(user.getTel())
			.address(user.getAddress())
			.description(user.getAddress())
			.zip(user.getZip())
			.report(user.getReport())
            .createAt(user.getCreateAt())
            .updateAt(user.getUpdateAt())
            .deleteAt(user.getDeleteAt())
            .deleteYn(user.getDeleteYn())
            .role(user.getRole())
            .file(user.getFile())
            .build();
		
		return dto;
	}

}
