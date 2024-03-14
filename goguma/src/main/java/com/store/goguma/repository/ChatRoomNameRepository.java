package com.store.goguma.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ChatRoomNameRepository {

	// 방 이름 저장
	public int save(@Param("userId")int userId ,@Param("roomId") int roomId ,@Param("roomName") String roomName);
	// 방 이름이 있는지확인
	public boolean isExistRoomName(@Param("userId")int userId ,@Param("roomId") int roomId );
	
	// 방 이름 업데이트
	public int updateRoomName(@Param("userId")int userId ,@Param("roomId") int roomId ,@Param("roomName") String roomName);
}
