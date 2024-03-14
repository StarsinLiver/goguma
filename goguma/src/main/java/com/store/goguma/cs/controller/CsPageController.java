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
	
	
	
	// admin

	@GetMapping("/notice/list/admin")
	public String noticeAdminList() {
		return "cs/notice/admin-list";
	}
	
	@GetMapping("/notice/detail/admin/{id}")
	public String noticeAdminDetail() {
		return "cs/notice/admin-detail";
	}
	
	@GetMapping("/notice/write/admin")
	public String noticeWrite() {
		return "cs/notice/admin-write";
	}
	
	@GetMapping("/notice/update/admin/{id}")
	public String noticeUpdate() {
		return "cs/notice/admin-update";
	}
}
