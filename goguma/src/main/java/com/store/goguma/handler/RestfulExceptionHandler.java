package com.store.goguma.handler;

import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.handler.exception.LoginRestfulException;


@Order(1)
@RestControllerAdvice
public class RestfulExceptionHandler {

	// 모든 예외 클래스 설정
	@ExceptionHandler(Exception.class)
	public void exception(Exception e) {
		System.out.println("--------------");
		System.out.println(e.getClass().getName());
		System.out.println(e.getMessage());
		System.out.println("--------------");
	}

	@ExceptionHandler(BackPageRestfulException.class)
	public String basicException(BackPageRestfulException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('" + e.getMessage() + "');");
		sb.append("window.history.back();");	// 뒤로가기
		sb.append("</script>");
		return sb.toString();
	}

	@ExceptionHandler(LoginRestfulException.class)
	public String basicException(LoginRestfulException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('" + e.getMessage() + "');");
		sb.append("location.href='/login';");	// 로그인 페이지 이동
		sb.append("</script>");
		return sb.toString();
	}
}