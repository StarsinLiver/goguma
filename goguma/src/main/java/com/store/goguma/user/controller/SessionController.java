package com.store.goguma.user.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class SessionController {

	private final HttpSession session;

	@GetMapping("/session")
	public ResponseEntity<?> getSession() {
		OauthDTO user = (OauthDTO) session.getAttribute("principal");
		if (user != null) {
			return new ResponseEntity<OauthDTO>(user, HttpStatus.OK);
		}
		return null;
	}
}
