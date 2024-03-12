package com.store.goguma.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class LoginRestfulException extends RuntimeException {

	// 상태코드
	private HttpStatus httpStatus;

	public LoginRestfulException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}
	// 사용하는 시점에 활용가능

}