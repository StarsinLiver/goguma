package com.store.goguma.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cs")
public class CsPageController {

	@GetMapping("/notice/list")
	public String noticeList() {
		return "cs/notice/list";
	}
	
	@GetMapping("/notice/detail/{id}")
	public String noticeDetail() {
		return "cs/notice/detail";
	}
	
	@GetMapping("/notice/write")
	public String noticeWrete() {
		return "cs/notice/write";
	}
}
