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

import com.store.goguma.chat.dto.chatMessage.ChatMessageDto;
import com.store.goguma.chat.dto.chatMessage.ChatMessageReqDto;
import com.store.goguma.entity.ChatMessage;
import com.store.goguma.service.ChatMessageService;
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

			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				// 오류 로직 처리
			}

			List<ChatMessageDto> messageList = chatMessageService.findAllByRoomId(roomId);
			log.info(messageList.toString());
			return new ResponseEntity<>(messageList, HttpStatus.OK);
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

			int result = chatMessageService.save(chatMessage2);
			if (result == 0) {
				// 서버 에러 로직
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
			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				// 오류 로직 처리
			}

			String path = emojiUploadService.uploadProcess(file.get(0));

			ChatMessage chatMessage = ChatMessage.builder().roomId(roomId).uId(user.getUId()).text(text).file(path)
					.chatMessageType(ChatType.IMAGE).build();

			int result = chatMessageService.save(chatMessage);
			if (result == 0) {
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