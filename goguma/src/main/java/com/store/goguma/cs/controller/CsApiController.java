package com.store.goguma.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.entity.Notice;
import com.store.goguma.service.NoticeService;

@RestController
@RequestMapping("/cs/api")
public class CsApiController {
	
	@Autowired
	private NoticeService service;

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
}
