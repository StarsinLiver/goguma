package com.store.goguma.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.cs.dto.NoticeRequestDto;
import com.store.goguma.entity.Notice;
import com.store.goguma.service.NoticeService;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/cs/api")
public class CsApiController {
	
	@Autowired
	private NoticeService service;
	
	@Autowired
	HttpSession httpSession;

	@GetMapping("/notice/list")
	public ResponseEntity<?> getNoticeList(){
		List<com.store.goguma.entity.Notice> list = service.getNoticeList();
		return new ResponseEntity<List<com.store.goguma.entity.Notice>>(list, HttpStatus.OK);
	}
	
	@GetMapping("/notice/detail/{id}")
	public ResponseEntity<?> getNoticeDetail(@PathVariable int id){
		Notice notice = service.getNoticeDetail(id);
		return new ResponseEntity<Notice>(notice, HttpStatus.OK);
	}
	
	@PostMapping("/notice/write")// 공지사항 등록(관리자쪽으로 이동해야함)
	public ResponseEntity<?> getNoticeWrite(NoticeRequestDto dto){
		System.out.println(dto);
		OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
		if (user != null) {
			dto.setUId(user.getUId());
		}
		boolean result = service.getNoticeWrite(dto);
		return new ResponseEntity<Boolean>(result, HttpStatus.OK);
	}
}
