package com.store.goguma.chat.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.chat.dto.chatRoom.ChatRoomUpdateDto;
import com.store.goguma.chat.dto.chatRoomName.ChatRoomNameDto;
import com.store.goguma.entity.ChatMessage;
import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.MainEmoji;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.ChatMessageService;
import com.store.goguma.service.ChatRoomNameService;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.EmojiHistoryService;
import com.store.goguma.service.EmojiService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.utils.ChatType;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {

	private final ChatMessageService chatMessageService;

	private final ChatRoomService chatRoomService;

	private final ChatRoomNameService chatRoomNameService;

	private final EmojiHistoryService emojiHistoryService;

	private final EmojiService emojiService;

	private final HttpSession httpSession;

	/**
	 * 채팅 타입 지정하기
	 * 
	 * @return
	 */
	@GetMapping("/room-select")
	public String getMethodName() {

		return "chat/chat_room_select";
	}

	/**
	 * 채팅방 전체 보기
	 * 
	 * @return
	 */
	@GetMapping("/room")
	public String roomForm(Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
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
		if (mainEmojiList != null && mainEmojiList.isEmpty() == false) {
			mainEmojiList.forEach((e) -> mainListToInt.add(e.getId()));
			emojiList = emojiService.findByGroupId(mainListToInt);
		}

		log.info(emojiList.toString());

		model.addAttribute("chatRoomList", chatRoomList);
		model.addAttribute("mainEmojiList", mainEmojiList);
		model.addAttribute("emojiList", emojiList);
		return "chat/chat_room";
	}

	@GetMapping("/room/update/{roomId}")
	public String updateRoomForm(@PathVariable Integer roomId, Model model) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		ChatRoomUpdateDto chatRoomUpdateDto = chatRoomService.findByRoomId(roomId, user.getUId());
		log.info("채팅방 : " + chatRoomUpdateDto);
		model.addAttribute("room", chatRoomUpdateDto);
		return "chat/chat_room_update";
	}

	// 채팅방 이름 수정
	@PutMapping("/room/update")
	public String updateRoomName(ChatRoomNameDto dto) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		// 유효성 검사
		if (dto.getRoomName() == null || dto.getRoomName().isEmpty()) {
			throw new BackPageRestfulException(com.store.goguma.utils.Define.ENTER_ROOM_NAME, HttpStatus.BAD_REQUEST);
		}

		// 방 이름이 있는지 확인
		boolean isExist = chatRoomNameService.isExistRoomName(user.getUId(), dto.getRoomId());
		System.out.println("방 이름이 있나요? : " + isExist);
		// 방 이름 업데이트
		if (isExist) {
			int result = chatRoomNameService.updateRoomName(user.getUId(), dto.getRoomId(), dto.getRoomName());
			if (result == 0) {
				throw new BackPageRestfulException(com.store.goguma.utils.Define.INTERVAL_SERVER_ERROR,
						HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}

		if (isExist == false) {
			chatRoomNameService.save(user.getUId(), dto.getRoomId(), dto.getRoomName());
		}

		return "redirect:/chat/room";
	}

	// 채팅방 나가기
	@DeleteMapping("/room/exit")
	public String exitRoom(Integer roomId) {

		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		// 채팅방 나가기 - exit = 'Y'
//		ChatRoomUpdateDto chatRoomUpdateDto = chatRoomService.findByRoomId(roomId, user.getUId());
//		log.info(chatRoomUpdateDto.toString());
//
//		int result = 0;
//		// 만약 유저가 채팅방의 u_id 라면
//		if (user.getUId() == chatRoomUpdateDto.getUserId()) {
//			result = chatRoomService.updateUserExit(roomId);
//		}
//
//		// 만약 유저가 채팅방의 host_id 라면
//		if (user.getUId() == chatRoomUpdateDto.getHostId()) {
//			result = chatRoomService.updateHostExit(roomId);
//		}
//
//		if (result == 0) {
//			throw new BackPageRestfulException(com.store.goguma.utils.Define.INTERVAL_SERVER_ERROR,
//					HttpStatus.INTERNAL_SERVER_ERROR);
//		}
		// 채팅 - EXIT 찍기
		ChatMessage message = ChatMessage.builder().uId(user.getUId()).text(user.getName() + "님께서 방에서 나가셨습니다.")
				.roomId(roomId).chatMessageType(ChatType.LEAVE).build();

		chatMessageService.save(message, user);
		return "redirect:/chat/room";
	}
}
