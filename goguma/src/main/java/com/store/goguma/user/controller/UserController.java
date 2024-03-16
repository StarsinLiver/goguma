package com.store.goguma.user.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.goguma.entity.User;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.UserService;
import com.store.goguma.user.dto.ModifyUserDto;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.my.QnaUserDTO;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;
import com.store.goguma.user.dto.my.UserEmojiDTO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private HttpSession httpSession;
	
	// 유저 페이지
	@Autowired
	private UserService userService;
	
	// 내 정보 조회 + 페이지
	@GetMapping("/info")
	public String infoPage(Model model) {
		OauthDTO dto = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (dto == null) {
            throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
        }
		
		String email = dto.getEmail();
		log.info("내 정보 : "+dto);
		log.info("이메일 : "+email);
		
		User userEntity = userService.readByuser(dto);
		log.info("userEntity : "+userEntity);
		
		model.addAttribute("user", userEntity);
		
		return "/user/info";
	}
	
	// 내 정보 수정 페이지
	@GetMapping("/modify")
	public String userModifyPage(Model model) {
		OauthDTO dto = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (dto == null) {
            throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
        }
		
		String email = dto.getEmail();
		log.info("내 정보 : "+dto);
		log.info("이메일 : "+email);
		
		User userEntity = userService.readByuser(dto);
		log.info("userEntity : "+userEntity);
		
		model.addAttribute("user", userEntity);
		
		return "/user/info_modify";
	}
	
	// 내 정보 수정 기능
	@PostMapping("/modify")
	public String userModify(ModifyUserDto dto) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (sessionUser == null) {
            throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
        }
		
		String email = sessionUser.getEmail();
		String social = sessionUser.getSocial();
		
		log.info("social : "+social);
		log.info("이메일 : "+email);
		
		dto.setEmail(email);
		dto.setSocial(social);
		
		userService.modifyUser(dto);
		
		return "redirect:/user/info";
	}
	
	// 결제 내역 페이지
	@GetMapping("/payment")
	public String paymentPage(RequestPageDTO historyReqDTO, Model model) {
		log.info("EmojiHistoryReqDTO :"+historyReqDTO);
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (sessionUser == null) {
            throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
        }
		
		int uId = sessionUser.getUId();
		
		// 출력
		ResponsePageDTO response = userService.myEmojiHistory(uId, historyReqDTO);
		
		
		model.addAttribute("histories", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());
		
		return "/user/payment_history";
	}
	
	// 이모티콘 구매내역 상세
	@GetMapping("/historyDetail")
	@ResponseBody
	public UserEmojiDTO historyDetail(@RequestParam("id") String id) {
		UserEmojiDTO history = userService.EmojiHistoryDetail(id);
		return history;
	}
	
	// 이모티콘 환불 사유 전송
	@PutMapping("/emojiReason")
	public int reason(@RequestBody Map<String, String> data) {
		String id = data.get("id");
		log.info("포트원 번호 : "+id);
		
		int result = userService.cancelEmoji(id);
		
		if(result > 1) {
			throw new RuntimeException("환불 기한이 지났습니다");
		}
		
		return result;
	}
	
	// 중고거래 내역 페이지
	@GetMapping("/product")
	public String productPage(RequestPageDTO pageDTO, Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		
		// 회원, 비회원 검증
		if (sessionUser == null) {
            throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
        }
		
		int uId = sessionUser.getUId();
		
		ResponsePageDTO response = userService.productList(uId, pageDTO);
		
		model.addAttribute("pHistories", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());
		
		return "/user/product_history";
	}
	
	// 내 게시글 페이지
	@GetMapping("/board")
	public String boardPage() {
		
		
		return "/user/board";
	}
	
	// 문의 내역
	@GetMapping("/myQna")
	public String qnaPage(RequestPageDTO requestPageDTO,Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		log.info("requestPageDTO : "+requestPageDTO);
		
		// 회원, 비회원 검증
		if (sessionUser == null) {
            throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
        }
		
		int uId = sessionUser.getUId();
		
		ResponsePageDTO response = userService.qnaList(requestPageDTO ,uId);
		
		
		
		model.addAttribute("qnaList", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());
		
		return "/user/my_qna";
	}
	
	// 문의 내역 삭제
	@PutMapping("/myQna/delete")
	@ResponseBody
	public int qnaDelete(@RequestBody Integer[] qnaIds) {
		log.info("qnaDelete...1");
		
		int result = userService.deleteQna(qnaIds);
		
		return result;
	}
	
	// 이모티콘(상품) 목록 페이지
	@GetMapping("/imoji")
	public String imojiPage(RequestPageDTO requestPageDTO,Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		log.info("requestPageDTO : "+requestPageDTO);
		
		// 회원, 비회원 검증
		if (sessionUser == null) {
            throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
        }
		
		int uId = sessionUser.getUId();
		
		ResponsePageDTO response = userService.imojiList(requestPageDTO, uId);
		
		log.info("response : "+response);
		
		model.addAttribute("imojiList", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());
		
		return "/user/my_imoji";
	}
	
	// 찜 목록 페이지
	@GetMapping("/wish")
	public String wishPage() {
		
		return "/user/wish";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logOutProc() {
		
		httpSession.invalidate();
		
		return "main";
	}
	
}
