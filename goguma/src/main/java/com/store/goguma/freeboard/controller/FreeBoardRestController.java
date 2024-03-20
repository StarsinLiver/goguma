package com.store.goguma.freeboard.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.entity.BoardCategorySub;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.BoardService;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.user.dto.OauthDTO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/free-board")
public class FreeBoardRestController {

	private final BoardService boardService;
	private final FreeBoardService freeBoardService;
	private final HttpSession httpSession;

	@GetMapping("/subcategory/{id}")
	public ResponseEntity<?> getMethodName(@PathVariable(value = "id") Integer param) {
		try {
			
			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
			}
			
			
			List<BoardCategorySub> list = freeBoardService.findSubCategoryByMainCateogry(user.getUId() , param);

			if (list.isEmpty() == false) {
				return new ResponseEntity<>(list, HttpStatus.OK);
			}
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

}
