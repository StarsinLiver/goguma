package com.store.goguma.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.store.goguma.entity.Emoji;
import com.store.goguma.entity.MainEmoji;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.AdminService;
import com.store.goguma.service.EmojiHistoryService;
import com.store.goguma.service.EmojiService;
import com.store.goguma.service.EmojiUploadService;
import com.store.goguma.service.PaymentService;
import com.store.goguma.service.UserService;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.utils.Define;
import com.store.goguma.utils.UserRole;
import com.store.goguma.utils.page.PageRes;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminRestController {

	private final AdminService adminService;

	private final PaymentService paymentService;

	private final EmojiUploadService emojiUploadService;

	private final EmojiHistoryService emojiHistoryService;

	private final EmojiService emojiService;

	private final HttpSession httpSession;
	
	private final UserService userService;

	// admin emoji 수정하기 ajax
	@PutMapping("/emoji/modify/{pageId}")
	public ResponseEntity<?> emojiModifyProc(@PathVariable(value = "pageId") int pageId,
			@RequestPart(value = "files") List<MultipartFile> files, @RequestParam("price") int price,
			@RequestParam("title") String title) {

		files.forEach((e) -> log.info("파일 : {}", e.getOriginalFilename()));

		// 파일 명 리스트
		List<String> fileList = new ArrayList<>();

		// 파일 업로드 하기
		files.forEach((e) -> fileList.add(emojiUploadService.uploadProcess(e)));

		// 데이터 베이스 수정
		log.info("파일 명 : {}", fileList);
		// 서브 이모지 전체 삭제
		int result = 0;
		result = emojiService.deleteSubEmojiByGroupId(pageId);
		if (result == 0) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// 메인 이모지 변경
		result = emojiService.updateMainEmoji(fileList.get(0), title, price, pageId);
		if (result == 0) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		// 서브 이모지 insert
		for (int i = 1; i < fileList.size(); i++) {
			Emoji emoji = Emoji.builder().file(fileList.get(i)).name("emoji_" + pageId + "_" + i).groupId(pageId)
					.build();
			result = emojiService.subUpload(emoji);
			if (result == 0) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}

	// 이모지 삭제하기
	@DeleteMapping("/emoji/delete/{pageId}")
	public ResponseEntity<?> deleteEmoji(@PathVariable(value = "pageId") int groupId) {
		try {

			// 이모지를 사용하고 있는 사람 확인
			int count = emojiHistoryService.countByMainEmojiId(groupId);
			if (count > 0) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}

			int result = 0;
			// 메인 이모지 삭제
			result = emojiService.deleteMainEmojiById(groupId);
			if (result == 0) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			// 서브 이미지 삭제 필요 없음
//			result = emojiService.deleteSubEmojiByGroupId(groupId);
//			if(result == 0) {
//				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//			}
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// admin 환불 처리 ajax
	@PostMapping("/payment-cancel")
	public ResponseEntity<?> updateConfirmPayment(@RequestParam(value = "merchantId") String merchantId,
			@RequestParam(value = "reason") String reason, @RequestParam(value = "amount") Integer amount) {
		try {
			if (merchantId == null || merchantId.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			if (reason == null || reason.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			if (amount < 0) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}

			String token = paymentService.getFortOneToken();

			boolean isTrue = paymentService.refund(token, merchantId, reason, amount);

			log.info("환불 완료?? {}", isTrue);

			// 환불 신청이 완료 되었다면 cancel_Yn = 'Y'
			if (isTrue) {
				adminService.updateCancelYnPayment(merchantId ,reason);
				return new ResponseEntity<>(HttpStatus.OK);
			}
			// merchantId로 환불 사유 검색

			// 에이젝스 success를 위해 하드코딩
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 이모지 리스트 출력, 페이징
	@GetMapping("/emoji/{num}")
	public ResponseEntity<?> managementEmoji(@PathVariable int num,
			@RequestParam(value = "search", defaultValue = "") String search,
			@RequestParam(value = "page", defaultValue = "0") Integer page,
			@RequestParam(value = "size", defaultValue = "20") Integer size) {

		try {

			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
			}

			List<MainEmoji> list = adminService.findEmojiDetailMainContainSearch(search, page, size);
			int count = adminService.countFindEmojiDetailMainContainSearch(search);
			PageRes<MainEmoji> pageRes = new PageRes<>(list, page, count, size);
			System.out.println("리스트 수 : " + list.size());

			return new ResponseEntity<PageRes<MainEmoji>>(pageRes, HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 마스터 권한 양도
	@PutMapping("/authority-master")
	public ResponseEntity<?> changeMasterAuthority(@RequestParam(value = "userId") int userId) {
		try {

			log.info("userId : {}", userId);

			OauthDTO user = (OauthDTO) httpSession.getAttribute("principal");
			if (user == null) {
				return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
			}
			
			
			
			// 해당 유저 권한 교체하기
			int result = userService.adminUpdateUserRole(userId, UserRole.MASTER);
			if (result == 0) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			// 마스터 권한을 admin 으로 강등
			int result2 = userService.adminUpdateUserRole(user.getUId(), UserRole.ADMIN);
			if (result2 == 0) {
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
			
			
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
