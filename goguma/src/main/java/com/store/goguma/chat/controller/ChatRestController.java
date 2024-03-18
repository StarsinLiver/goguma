package com.store.goguma.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.chat.dto.ChatUtil;
import com.store.goguma.chat.dto.chatMessage.ChatMessageDto;
import com.store.goguma.chat.dto.chatMessage.ChatMessageReqDto;
import com.store.goguma.chat.dto.chatRoom.ChatRoomDto;
import com.store.goguma.entity.ChatMessage;
import com.store.goguma.service.ChatMessageService;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.EmojiUploadService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.utils.ChatType;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/chat")
public class ChatRestController {

	@Autowired
	ChatMessageService chatMessageService;

	@Autowired
	ChatRoomService chatRoomService;

	@Autowired
	EmojiUploadService emojiUploadService;

	@Autowired
	HttpSession httpSession;

	/**
	 * 방 번호에 대한 모든 채팅 가져오기
	 * 
	 * @param roomId
	 * @return
	 */
	@GetMapping("/message/{roomId}")
	public ResponseEntity<?> getMethodName(@PathVariable(value = "roomId") Integer roomId) {
		try {

			// 만약 유저가 로그인이 되어 잇지 않다면
			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(ChatUtil.USER_NOT_LOGIN, HttpStatus.OK);
			}

			List<ChatMessageDto> messageList = chatMessageService.findAllByRoomId(roomId);
			log.info(messageList.toString());
			return new ResponseEntity<>(messageList, HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 사용자가 포함되어 있는 모든 방 번호 가져오기
	@GetMapping("/user/room")
	public ResponseEntity<?> findAllUserRoom() {
		try {
			
			// 만약 유저가 로그인이 되어 잇지 않다면
			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(ChatUtil.USER_NOT_LOGIN, HttpStatus.OK);
			}
			// 만약 유저가 로그인 되어 있다면
			// 채팅방 가져오기
			List<ChatRoomDto> chatRoomList = chatRoomService.findAllByUserId(user.getUId());

			return new ResponseEntity<>(chatRoomList, HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// ------------------------- 소켓
	/**
	 * 이모티콘 , 텍스트 받기
	 * 
	 * @param chatMessage
	 */
	@MessageMapping("/chat/sendMessage")
	public ResponseEntity<?> sendMessage(@Payload ChatMessageReqDto chatMessage) {
		try {

			ChatMessage chatMessage2 = ChatMessage.builder().text(chatMessage.getText()).emoji(chatMessage.getEmoji())
					.emoji(chatMessage.getEmoji()).roomId(chatMessage.getRoomId()).uId(chatMessage.getUserId())
					.chatMessageType(chatMessage.getChatMessageType()).build();

			OauthDTO user = OauthDTO.builder().uId(chatMessage.getUserId()).name(chatMessage.getUserName()).file(chatMessage.getFile()).build();
					
			boolean result = chatMessageService.save(chatMessage2 , user);
			if (result) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/image")
	public ResponseEntity<?> postMethodName(@RequestParam(value = "roomId") Integer roomId,
			@RequestParam(value = "text") String text, @RequestParam(value = "file") List<MultipartFile> file,
			@RequestParam(value = "chatMessageType") Integer messageType) {
		try {
			// 만약 유저가 로그인이 되어 잇지 않다면
			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(ChatUtil.USER_NOT_LOGIN, HttpStatus.OK);
			}

			String path = emojiUploadService.uploadFileProcess(file.get(0));

			ChatMessage chatMessage = ChatMessage.builder().roomId(roomId).uId(user.getUId()).text(text).file(path)
					.chatMessageType(ChatType.IMAGE).build();

			boolean result = chatMessageService.save(chatMessage , user);
			if (result) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 현재 이부분이 안됨 딱히 상관은 없는데 짜증나네 ㅋㅋㅋㅋㅋㅋㅋ
	@SubscribeMapping("/sub/chat/{roomId}")
//    public ChatRoom joinRoom(@DestinationVariable String roomId) {
	public void joinRoom(@DestinationVariable String roomId) {
		System.out.println("구독 룸넘버  | " + roomId);
	}

}
