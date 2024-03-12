package com.store.goguma.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class BackPageRestfulException extends RuntimeException {

	private HttpStatus httpStatus;

	public BackPageRestfulException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}

}

