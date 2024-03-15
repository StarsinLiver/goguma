package com.store.goguma.admin.controller;

import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.admin.dto.EmojiModifyDTO;
import com.store.goguma.service.AdminModifyEmojiService;
import com.store.goguma.service.AdminService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/admin")
public class AdminRestController {

	
	@Autowired
	AdminService adminService;
	
	@Autowired
	AdminModifyEmojiService ModifyEmojiService; 
	
	// admin emoji 수정하기 ajax
	@PutMapping("/emoji/modify/{pageId}")
	public ResponseEntity<Boolean> emojiModifyProc(@PathVariable int pageId,  @RequestPart(value="file") List<MultipartFile> file,
            @RequestParam("price") int price,
            @RequestParam("title") String title) {
		
		log.info("이모지 모디파이 프록 컨트롤러탐 !!!!");
		
		
		EmojiModifyDTO dto = EmojiModifyDTO.builder()
							.id(pageId)
							.price(price)
							.name(title)
							.build();
		
		
		log.info("이모지 디티오값 확인: " + dto.toString());
		
		boolean result = ModifyEmojiService.emojiFileUpload(dto, file);
		
		 
		 return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		
	}
}
