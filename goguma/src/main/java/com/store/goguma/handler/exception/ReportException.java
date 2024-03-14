package com.store.goguma.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class ReportException extends RuntimeException {

	private HttpStatus httpStatus;

	public ReportException(String message, HttpStatus httpStatus) {
		super(message);
		this.httpStatus = httpStatus;
	}

}

