package com.store.goguma.emoji.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.emoji.dto.EmojiHistoryReqDto;
import com.store.goguma.emoji.dto.EmojiUploadDto;
import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.MainEmoji;
import com.store.goguma.service.EmojiUploadService;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/emoji/api")
public class EmojiApiController {
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	private EmojiUploadService service;

	@PostMapping("/upload")
	public ResponseEntity<?> emojiFileUpload(@RequestPart(value="obj") EmojiUploadDto dto, 
			@RequestPart(value = "file", required=false) List<MultipartFile> files){	
		boolean result = service.emojiFileUpload(dto, files);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}

	@GetMapping("/list/{num}")
	public ResponseEntity<?> getEmojiMainList(@PathVariable int num){
		List<MainEmoji> list = service.getEmojiMainList(num);
		System.out.println("리스트 수 : " + list.size());
		return new ResponseEntity<List<MainEmoji>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/detail/main/{num}")
	public ResponseEntity<?> getEmojiDetailMain(@PathVariable int num){
		MainEmoji emoji = service.getEmojiDetailMain(num);
		return new ResponseEntity<MainEmoji>(emoji, HttpStatus.OK);
	}
	
	@GetMapping("/detail/sub/{num}")
	public ResponseEntity<?> getEmojiDetailList(@PathVariable int num){
		List<Emoji> list = service.getEmojiDetailList(num);
		return new ResponseEntity<List<Emoji>>(list, HttpStatus.OK);
	}
	
	@PostMapping("/order")
	public ResponseEntity<?> emojiOrder(EmojiHistoryReqDto dto){
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user != null) {
			dto.setUId(user.getUId());
		}
		boolean result = service.emojiOrder(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
}
