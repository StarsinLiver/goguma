package com.store.goguma.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

import com.store.goguma.admin.dto.AdminChatRoomDto;
import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.chat.dto.chatRoom.ChatRoomUpdateDto;
import com.store.goguma.entity.ChatRoom;
import com.store.goguma.entity.User;

@Mapper
public interface ChatRoomRepository {

	/**
	 * 자신이 속한 방 전체 조회
	 * @param userId
	 * @return
	 */
	public List<ChatRoomDto> findAllByUserId(int userId);

	// 채팅방 생성
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int saveRoom(ChatRoom chatRoom);

	/**
	 * 방 상세조회
	 * @param roomId
	 * @param userId
	 * @return
	 */
	public ChatRoomUpdateDto findByRoomId(@Param("roomId")int roomId ,@Param("userId") int userId);
	
	
	/**
	 * 해당 방 번호의 유저 방 나가기
	 * @param roomId
	 * @return
	 */
	public int updateUserExit(int roomId);
	
	/**
	 * 해당 방 번호의 호스트 방 나가기
	 * @param roomId
	 * @return
	 */
	public int updateHostExit(int roomId);

	public int isExistChatRoom(@Param("pId")int pId, @Param("uId")int uId);
	
	public int countChatRoomAll();
	
	// 관리자 채팅방 목록 전체 불러오기
	public List<AdminChatRoomDto>  adminFindAllByProductName(@Param("start") int start , @Param("search") String productName , @Param("searchType") String searchType);
	// 관리자 채팅방 목록 전체 불러오기 카운트
	public int countAdminFindAllByProductName(@Param("search") String productName , @Param("searchType") String searchType);
	
	// 관리자가 채팅방 삭제
	public int deleteChatRoom(int id);
	
	// 채팅 목록
	public List<User> selectByProductId(int pId);
}
