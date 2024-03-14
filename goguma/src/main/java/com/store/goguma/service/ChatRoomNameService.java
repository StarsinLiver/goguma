package com.store.goguma.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.repository.ChatRoomNameRepository;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class ChatRoomNameService {

	@Autowired
	ChatRoomNameRepository chatRoomNameRepository;

	// 방 이름 바꾸기
	@Transactional
	public int updateRoomName(int userId , int roomId , String roomName) {
		return  chatRoomNameRepository.updateRoomName(userId, roomId, roomName);
	}
	
	// 방 이름이 있는지확인
	public boolean isExistRoomName(int userId , int roomId) {
		return chatRoomNameRepository.isExistRoomName(userId, roomId);
	}
	
	@Transactional
	public int save(int userId , int roomId , String roomName) {
		int result = chatRoomNameRepository.save(userId, roomId, roomName);
		if (result == 0) {
			throw new BackPageRestfulException(com.store.goguma.utils.Define.INTERVAL_SERVER_ERROR,
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
}
