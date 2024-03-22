package com.store.goguma.handler;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

	private static final String PATH = "/error"; // configure 에서 Redirect 될 path

	@RequestMapping(value = PATH)
	public String error(HttpServletRequest request) {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

		if (String.valueOf(status).equalsIgnoreCase(HttpStatus.NOT_FOUND.toString())) {
			return "error/error"; // /WEB-INF/errors/404.jsp
		}
		return "error/error";
	}

	public String getErrorPath() {
		return PATH;
	}
}