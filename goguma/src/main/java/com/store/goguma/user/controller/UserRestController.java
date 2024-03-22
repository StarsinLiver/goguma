package com.store.goguma.user.controller;

import java.util.List;
import java.util.Map;

import org.apache.catalina.Host;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.store.goguma.entity.User;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.ChatRoomService;
import com.store.goguma.service.PaymentService;
import com.store.goguma.service.ProductHistoryService;
import com.store.goguma.service.ProductService;
import com.store.goguma.service.UserService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.ProductHistoryReqDto;
import com.store.goguma.user.dto.my.UserEmojiDTO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserRestController {

	private final HttpSession httpSession;
	private final UserService userService;
	private final PaymentService paymentService;
	private final ChatRoomService chatRoomService;
	private final ProductHistoryService productHistoryService;
	private final ProductService productService;
	
	// 이모티콘 구매내역 상세
	@GetMapping("/historyDetail")
	@ResponseBody
	public UserEmojiDTO historyDetail(@RequestParam("id") String id) {
		UserEmojiDTO history = userService.EmojiHistoryDetail(id);
		return history;
	}

	// 이모티콘 환불 사유 전송
	@PutMapping("/emojiReason")
	public ResponseEntity<?> reason(@RequestBody Map<String, String> data) {
		String merchantid = data.get("id"); // 포트원 번호
		String reason = data.get("content"); // 환불 사유
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int uId = sessionUser.getUId();

		// 환불 신청
		UserEmojiDTO dto = userService.cancelEmoji(merchantid, uId, reason);
		String content = dto.getCancelReason(); // 환불 사유
		int price = dto.getCancelAmount(); // 환불 비용

		// 환불 전송
		String token = paymentService.getFortOneToken();
		boolean isTrue = paymentService.refund(token, merchantid, content, price);

		// 환불 신청이 완료 되었다면 cancel_Yn = 'Y'
		if (isTrue) {
			return new ResponseEntity<>(HttpStatus.OK);
		}

		return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 문의 내역 삭제
	@PutMapping("/myQna/delete")
	@ResponseBody
	public int qnaDelete(@RequestBody Integer[] qnaIds) {
		log.info("qnaDelete...1");

		int result = userService.deleteQna(qnaIds);

		return result;
	}

	// 챗룸 불러오기
	@GetMapping("/chat/product")
	@ResponseBody
	public ResponseEntity<?> productHostChat(@RequestParam("pId") int pId) {
		try {
			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");

			if (user == null) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			
			log.info("받는 pid : {}" , pId);
			List<User> list = chatRoomService.chatProductUserList(pId);

			if (list.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			return new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/chat/product/selected")
	public ResponseEntity<?> selectedUser(@RequestParam(value = "userId") Integer userId,
			@RequestParam("hostId") Integer hostId, @RequestParam("pId") Integer pId) {
		try {
			log.info("받은 데이터 {}", userId);
			log.info("받은 데이터 {}", hostId);
			log.info("받은 데이터 {}", pId);

			int result = productHistoryService.save(pId, userId);
			if (result == 0) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			result = productService.updateConfirmYn(pId);
			if (result == 0) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {

			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}
}
