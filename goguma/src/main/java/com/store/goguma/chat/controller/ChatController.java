package com.store.goguma.chat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.MainEmoji;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.EmojiHistoryService;
import com.store.goguma.service.EmojiService;
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
	EmojiHistoryService emojiHistoryService;
	
	@Autowired
	EmojiService emojiService;

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
			throw new LoginRestfulException("로그인을 해 주세요." , HttpStatus.BAD_REQUEST);
		}
		// 채팅방 가져오기
		List<ChatRoomDto> chatRoomList = chatRoomService.findAllByUserId(user.getUId());
		log.info(chatRoomList.toString());
		// 모든 메인 이모지 가져오기
		List<MainEmoji> mainEmojiList = emojiHistoryService.findMainEmojiAllByUserId(user.getUId());
		log.info(mainEmojiList.toString());
		// 자식 이모티콘
		List<Emoji> emojiList = new ArrayList<>();
		
		// 메인 이모지의 기본키 ( id ) 배열 만들기 + 자식 이모티콘 찾기
		List<Integer> mainListToInt = new ArrayList<>();
		// mainEmojiList 리스트를 반복하면서 각 요소의 ID를 mainListToInt 리스트에 추가
		if(mainEmojiList != null && mainEmojiList.isEmpty() == false) {
			mainEmojiList.forEach((e) -> mainListToInt.add(e.getId()));
			emojiList = emojiService.findByGroupId(mainListToInt);
		}
		
		
		log.info(emojiList.toString());
		
		model.addAttribute("chatRoomList" , chatRoomList);
		model.addAttribute("mainEmojiList" , mainEmojiList);
		model.addAttribute("emojiList" , emojiList);
		return "chat/chat_room";
	}
}
