package com.store.goguma.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.entity.User;

import jakarta.servlet.http.HttpSession;

@RestController
public class SessionController {

	@Autowired
	private HttpSession session;
	
	@GetMapping("/session")
	public ResponseEntity<?> getSession(){
		User user = (User) session.getAttribute("principal");
		if(user != null) {
			return new ResponseEntity<User>(user, HttpStatus.OK);
		}
		return null;
	}
}
// uId