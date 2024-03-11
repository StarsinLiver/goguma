package com.store.goguma.emoji.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.emoji.dto.EmojiUploadDto;
import com.store.goguma.service.EmojiUploadService;


@RestController
@RequestMapping("/emoji/api")
public class EmojiApiController {
	
	@Autowired
	private EmojiUploadService service;

	@PostMapping("/upload")
	public ResponseEntity<?> emojiFileUpload(@RequestPart(value="obj") EmojiUploadDto dto, 
			@RequestPart(value = "file", required=false) List<MultipartFile> files){	
		boolean result = service.emojiFileUpload(dto, files);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}


}
