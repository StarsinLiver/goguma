package com.store.goguma.emoji.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @fileName : EmojiPageController.java
 * @Project : goguma
 * @Date : 2024. 3. 11.
 * @작성자 : 강민
 * @설명 : 
 */

@Controller
@RequestMapping("/emoji")
public class EmojiPageController {

	@GetMapping("/list")
	public String home() {
		return "emoji/list";
	}
	@GetMapping("/file")
	public String file() {
		return "emoji/upload";
	}
	@GetMapping("/detail/{id}")
	public String detail() {
		return "emoji/detail";
	}
	@GetMapping("/refund")
	public String refund() {
		return "emoji/refund";
	}
}
