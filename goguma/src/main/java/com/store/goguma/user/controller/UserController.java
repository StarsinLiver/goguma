package com.store.goguma.user.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.store.goguma.admin.dto.AdminQnaDto;
import com.store.goguma.entity.BoardCategoryMain;
import com.store.goguma.entity.User;
import com.store.goguma.freeboard.dto.UserFreeBoardPageReqDto;
import com.store.goguma.freeboard.dto.UserFreeBoardPageResDto;
import com.store.goguma.handler.exception.BackPageRestfulException;
import com.store.goguma.handler.exception.LoginRestfulException;
import com.store.goguma.service.FreeBoardService;
import com.store.goguma.service.QnaService;
import com.store.goguma.service.UserService;
import com.store.goguma.user.dto.ModifyUserDto;
import com.store.goguma.user.dto.OauthDTO;
import com.store.goguma.user.dto.UserProfileDto;
import com.store.goguma.user.dto.my.RequestPageDTO;
import com.store.goguma.user.dto.my.ResponsePageDTO;
import com.store.goguma.utils.Define;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final HttpSession httpSession;
	private final UserService userService;
	private final QnaService qnaService;
	private final FreeBoardService freeBoardService;

	// 내 정보 조회 + 페이지
	@GetMapping("/info")
	public String infoPage(Model model) {
		OauthDTO dto = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (dto == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		String email = dto.getEmail();
		log.info("내 정보 : " + dto);
		log.info("이메일 : " + email);

//		User userEntity = userService.readByuser(dto);
		
		UserProfileDto userEntity = userService.findProfileById(dto.getUId());
		log.info("userEntity : " + userEntity);
		int temperature = userService.getTemperatureUser(dto.getUId());

		log.info("유저의 온도 : {}", temperature);
		log.info("유저 : {}"  , userEntity);

		model.addAttribute("user", userEntity);
		model.addAttribute("temperature", temperature);

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
		log.info("내 정보 : " + dto);
		log.info("이메일 : " + email);

		User userEntity = userService.readByuser(dto);
		log.info("userEntity : " + userEntity);

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

		log.info("social : " + social);
		log.info("이메일 : " + email);

		
		
		dto.setEmail(email);
		dto.setSocial(social);

		userService.modifyUser(dto);

		return "redirect:/user/info";
	}

	// 결제 내역 페이지
	@GetMapping("/payment")
	public String paymentPage(RequestPageDTO historyReqDTO, Model model) {
		log.info("EmojiHistoryReqDTO :" + historyReqDTO);
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

	// 중고거래 내역 페이지
	@GetMapping("/product")
	public String productPage(RequestPageDTO pageDTO, Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int uId = sessionUser.getUId();

		// 게시물 정보 받기
		ResponsePageDTO response = userService.productList(uId, pageDTO);

		model.addAttribute("pHistories", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());

		return "/user/product_history";
	}

	// 내 물품 목록 페이지
	@GetMapping("/product/host")
	public String productHostPage(RequestPageDTO pageDTO, Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int uId = sessionUser.getUId();

		ResponsePageDTO response = userService.productHostList(uId, pageDTO);

		log.info("test : " + response.getDtoList());

		model.addAttribute("productList", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());

		return "/user/product_host_history";
	}

	// 내 게시글 페이지
	@GetMapping("/board")
	public String boardPage(UserFreeBoardPageReqDto request, Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		if (request.getMainCategory() == null) {
			request.setMainCategory(0);
			request.setSubCategory(0);
		}
		
		log.info("request : {}" , request);
		// 게시물 정보 가져오기
		UserFreeBoardPageResDto response = freeBoardService.findByUserId(request, sessionUser.getUId());
		// 메인 카테고리 정보 가져오기
		List<BoardCategoryMain> mainCategoryList = freeBoardService.findMainCategoryByUserId(sessionUser.getUId());
		
		log.info("board : {}" ,response.getDtoList());
		model.addAttribute("boardList", response.getDtoList());
		model.addAttribute("mainCategoryList", mainCategoryList);
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());
		return "/user/board";
	}

	// 문의 내역
	@GetMapping("/myQna")
	public String qnaPage(RequestPageDTO requestPageDTO, Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		log.info("requestPageDTO : " + requestPageDTO);

		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int uId = sessionUser.getUId();

		ResponsePageDTO response = userService.qnaList(requestPageDTO, uId);

		model.addAttribute("qnaList", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());

		return "/user/my_qna";
	}

	// 내 문의하기 상세
	@GetMapping("/myQna/view/{qid}")
	public String myViewPage(@PathVariable("qid") int qid, Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		AdminQnaDto adminQnaDto = qnaService.adminFindByQid(qid);

		log.info("상세 : " + adminQnaDto);

		model.addAttribute("detail", adminQnaDto);

		return "/user/my_qna_view";
	}

	// 이모티콘 목록 페이지
	@GetMapping("/imoji")
	public String imojiPage(RequestPageDTO requestPageDTO, Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		log.info("requestPageDTO : " + requestPageDTO);

		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}

		int uId = sessionUser.getUId();

		ResponsePageDTO response = userService.imojiList(requestPageDTO, uId);

		log.info("response : " + response);

		model.addAttribute("imojiList", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());

		return "/user/my_imoji";
	}

	// 찜 목록 페이지
	@GetMapping("/wish")
	public String wishPage(RequestPageDTO requestPageDTO, Model model) {
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");
		log.info("requestPageDTO : " + requestPageDTO);

		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		int uId = sessionUser.getUId();

		ResponsePageDTO response = userService.wishList(requestPageDTO, uId);

		model.addAttribute("wishList", response.getDtoList());
		model.addAttribute("pg", response.getPg());
		model.addAttribute("start", response.getStart());
		model.addAttribute("end", response.getEnd());
		model.addAttribute("last", response.getLast());

		return "/user/wish";
	}
	
	@DeleteMapping("/delete/{uId}")
	public String deleteUser(@PathVariable(value = "uId") Integer uId) {
		
		OauthDTO sessionUser = (OauthDTO) httpSession.getAttribute("principal");

		// 회원, 비회원 검증
		if (sessionUser == null) {
			throw new LoginRestfulException(com.store.goguma.utils.Define.ENTER_YOUR_LOGIN, HttpStatus.BAD_REQUEST);
		}
		
		int result = userService.deleteUser(uId);
		if(result == 0) {
			throw new BackPageRestfulException(Define.INTERVAL_SERVER_ERROR, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return "redirect:/user/logout";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logOutProc() {

		httpSession.invalidate();

		return "main";
	}

}
