package com.store.goguma.category.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class CategoryPageController {

	@GetMapping("/list")
	public String list() {
		return "board/list";
	}
	
	@GetMapping("/cate-setting")
	public String cateSetting() {
		return "board/admin-cate-setting";
	}
}
