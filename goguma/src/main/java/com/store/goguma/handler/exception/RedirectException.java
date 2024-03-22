package com.store.goguma.handler.exception;

import org.springframework.http.HttpStatus;

public class RedirectException  extends RuntimeException {

	private HttpStatus httpStatus;

	public RedirectException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}

}
