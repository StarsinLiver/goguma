package com.store.goguma.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.service.ChatRoomService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatRoomService chatRoomService;

	/**
	 * 채팅 타입 지정하기
	 * @return
	 */
	@GetMapping("/room-select")
	public String getMethodName() {
		
		return "chat/chat_room_select";
	}
	
	/**
	 * 채팅방 전체 보기
	 * @return
	 */
	@GetMapping("/room")
	public String roomForm(Model model) {
		int userId = 1;
		List<ChatRoomDto> chatRoomList = chatRoomService.findAllByUserId(userId);
		log.info(chatRoomList.toString());
		
		model.addAttribute("chatRoomList" , chatRoomList);
		return "chat/chat_room";
	}
}
