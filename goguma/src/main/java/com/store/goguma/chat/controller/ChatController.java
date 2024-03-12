package com.store.goguma.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatRoomService chatRoomService;

	@Autowired
	HttpSession httpSession;
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


		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			// 오류 로직 처리
		}
		List<ChatRoomDto> chatRoomList = chatRoomService.findAllByUserId(user.getUId());
		
		
		
		log.info(chatRoomList.toString());
		
		model.addAttribute("chatRoomList" , chatRoomList);
		return "chat/chat_room";
	}
}
