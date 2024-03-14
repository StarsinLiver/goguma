package com.store.goguma.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class ChatRoomException extends RuntimeException {

	private HttpStatus httpStatus;

	public ChatRoomException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}

}

